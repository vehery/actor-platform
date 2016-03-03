/*
 * Copyright (C) 2015 Actor LLC. <https://actor.im>
 */

package im.actor.core.modules.messaging.dialogs;

import java.io.IOException;
import java.util.ArrayList;

import im.actor.core.api.ApiDialog;
import im.actor.core.api.rpc.RequestLoadDialogs;
import im.actor.core.api.rpc.ResponseLoadDialogs;
import im.actor.core.entity.Peer;
import im.actor.core.entity.content.AbsContent;
import im.actor.core.modules.ModuleContext;
import im.actor.core.modules.messaging.dialogs.messages.DialogsLoaded;
import im.actor.core.modules.messaging.entity.DialogHistory;
import im.actor.core.util.ModuleActor;
import im.actor.runtime.actors.ActorRef;
import im.actor.runtime.function.Consumer;

import static im.actor.core.modules.messaging.entity.EntityConverter.convert;

public class DialogsHistoryActor extends ModuleActor {

    private static final int LIMIT = 20;

    private static final String KEY_LOADED_DATE = "dialogs_history_date";
    private static final String KEY_LOADED = "dialogs_history_loaded";
    private static final String KEY_LOADED_INIT = "dialogs_history_inited";

    private final ActorRef dialogsActor;

    private long historyMaxDate;
    private boolean historyLoaded;

    private boolean isLoading = false;
    private boolean isInited = false;

    public DialogsHistoryActor(ActorRef dialogsActor, ModuleContext context) {
        super(context);
        this.dialogsActor = dialogsActor;
    }

    @Override
    public void preStart() {

        historyMaxDate = Long.MAX_VALUE;
        historyLoaded = false;
        if (isPersistenceEnabled()) {
            historyLoaded = preferences().getBool(KEY_LOADED, false);
            historyMaxDate = preferences().getLong(KEY_LOADED_DATE, Long.MAX_VALUE);
        }

        if (!preferences().getBool(KEY_LOADED_INIT, false)) {
            self().send(new LoadMore());
        } else {
            isInited = true;
            context().getWarmer().onDialogsLoaded();
        }
    }

    private void onLoadMore() {
        if (!historyLoaded & !isLoading) {
            isLoading = true;

            api(new RequestLoadDialogs(historyMaxDate, LIMIT)).then(new Consumer<ResponseLoadDialogs>() {
                @Override
                public void apply(final ResponseLoadDialogs responseLoadDialogs) {
                    updates().executeRelatedResponse(responseLoadDialogs.getUsers(), responseLoadDialogs.getGroups(), self(), new Runnable() {
                        @Override
                        public void run() {
                            onLoadDialogs(responseLoadDialogs);
                        }
                    });
                }
            }).done(self());
        }
    }

    private void onLoadDialogs(ResponseLoadDialogs dialogsResponse) {

        ArrayList<DialogHistory> dialogs = new ArrayList<>();

        long maxLoadedDate = Long.MAX_VALUE;

        for (ApiDialog dialog : dialogsResponse.getDialogs()) {

            maxLoadedDate = Math.min(dialog.getSortDate(), maxLoadedDate);

            Peer peer = Peer.fromApiPeer(dialog.getPeer());
            if (peer == null) {
                continue;
            }
            AbsContent msgContent;
            try {
                msgContent = AbsContent.fromMessage(dialog.getMessage());
            } catch (IOException e) {
                e.printStackTrace();
                continue;
            }

            dialogs.add(new DialogHistory(peer, dialog.getUnreadCount(), dialog.getSortDate(),
                    dialog.getRid(), dialog.getDate(), dialog.getSenderUid(), msgContent, convert(dialog.getState())));
        }

        if (dialogs.size() > 0) {
            dialogsActor.send(new DialogsLoaded(dialogs));
            historyMaxDate = maxLoadedDate;
            historyLoaded = false;
        } else {
            historyMaxDate = 0;
            historyLoaded = true;
        }

        if (isPersistenceEnabled()) {
            preferences().putLong(KEY_LOADED_DATE, maxLoadedDate);
            preferences().putBool(KEY_LOADED, historyLoaded);
            preferences().putBool(KEY_LOADED_INIT, true);
        }

        if (!isInited) {
            isInited = true;
            context().getWarmer().onDialogsLoaded();
            unstashAll();
        }
    }

    public void onDialogsMessage() {
        if (isInited) {
            forward(dialogsActor);
        } else {
            stash();
        }
    }

    // Messages

    @Override
    public void onReceive(Object message) {
        if (message instanceof LoadMore) {
            onLoadMore();
        } else {
            onDialogsMessage();
        }
    }

    public static class LoadMore {

    }
}
