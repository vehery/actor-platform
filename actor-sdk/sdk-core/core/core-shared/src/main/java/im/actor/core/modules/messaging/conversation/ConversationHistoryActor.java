/*
 * Copyright (C) 2015 Actor LLC. <https://actor.im>
 */

package im.actor.core.modules.messaging.conversation;

import java.io.IOException;
import java.util.ArrayList;

import im.actor.core.api.ApiGroup;
import im.actor.core.api.ApiMessageContainer;
import im.actor.core.api.ApiMessageReaction;
import im.actor.core.api.rpc.RequestLoadHistory;
import im.actor.core.api.rpc.ResponseLoadHistory;
import im.actor.core.entity.Message;
import im.actor.core.entity.MessageState;
import im.actor.core.entity.Peer;
import im.actor.core.entity.Reaction;
import im.actor.core.entity.content.AbsContent;
import im.actor.core.modules.ModuleContext;
import im.actor.core.modules.messaging.entity.EntityConverter;
import im.actor.core.modules.messaging.router.RouterInt;
import im.actor.core.modules.updates.internal.MessagesHistoryLoaded;
import im.actor.core.util.ModuleActor;
import im.actor.core.network.RpcCallback;
import im.actor.core.network.RpcException;
import im.actor.runtime.collections.ManagedList;
import im.actor.runtime.function.Consumer;

public class ConversationHistoryActor extends ModuleActor {

    private static final int LIMIT = 20;

    private final String KEY_LOADED_DATE;
    private final String KEY_LOADED;
    private final String KEY_LOADED_INIT;
    private final Peer peer;

    private RouterInt router;
    private long historyMaxDate;
    private boolean historyLoaded;

    private boolean isLoading = false;

    public ConversationHistoryActor(Peer peer, ModuleContext context) {
        super(context);
        this.peer = peer;
        this.KEY_LOADED_DATE = "conv_" + peer + "_history_date";
        this.KEY_LOADED = "conv_" + peer + "_history_loaded";
        this.KEY_LOADED_INIT = "conv_" + peer + "_history_inited";
    }

    @Override
    public void preStart() {
        super.preStart();
        historyMaxDate = Long.MAX_VALUE;
        historyLoaded = false;
        router = context().getMessagesModule().getRouter();
        if (isPersistenceEnabled()) {
            historyMaxDate = preferences().getLong(KEY_LOADED_DATE, Long.MAX_VALUE);
            historyLoaded = preferences().getBool(KEY_LOADED, false);
        }
        if (!preferences().getBool(KEY_LOADED_INIT, false)) {
            self().send(new LoadMore());
        } else {
            context().getMessagesModule().markAsLoaded(peer);
        }
    }

    private void onLoadMore() {
        if (historyLoaded) {
            return;
        }
        if (isLoading) {
            return;
        }
        isLoading = true;

        api(new RequestLoadHistory(buidOutPeer(peer), historyMaxDate, LIMIT)).then(new Consumer<ResponseLoadHistory>() {
            @Override
            public void apply(final ResponseLoadHistory responseLoadHistory) {
                updates().executeRelatedResponse(responseLoadHistory.getUsers(), new ArrayList<ApiGroup>(), self(), new Runnable() {
                    @Override
                    public void run() {

                        ArrayList<Message> messages = new ArrayList<>();
                        long maxLoadedDate = Long.MAX_VALUE;
                        for (ApiMessageContainer historyMessage : responseLoadHistory.getHistory()) {

                            maxLoadedDate = Math.min(historyMessage.getDate(), maxLoadedDate);

                            AbsContent content = null;
                            try {
                                content = AbsContent.fromMessage(historyMessage.getMessage());
                            } catch (IOException e) {
                                e.printStackTrace();
                            }
                            if (content == null) {
                                continue;
                            }
                            MessageState state = EntityConverter.convert(historyMessage.getState());

                            ArrayList<Reaction> reactions = new ArrayList<>();

                            for (ApiMessageReaction r : historyMessage.getReactions()) {
                                reactions.add(new Reaction(r.getCode(), r.getUsers()));
                            }

                            messages.add(new Message(historyMessage.getRid(), historyMessage.getDate(),
                                    historyMessage.getDate(), historyMessage.getSenderUid(),
                                    state, content, reactions));
                        }

                        // Sending updates to conversation actor
                        if (messages.size() > 0) {
                            router.onMessagesLoaded(peer, messages);
                        }

                        onLoadedMore(messages.size(), maxLoadedDate);
                    }
                });

            }
        }).done(self());
    }

    private void onLoadedMore(int loaded, long maxLoadedDate) {
        isLoading = false;

        if (loaded < LIMIT) {
            historyLoaded = true;
        } else {
            historyLoaded = false;
            historyMaxDate = maxLoadedDate;
        }

        if (isPersistenceEnabled()) {
            preferences().putLong(KEY_LOADED_DATE, maxLoadedDate);
            preferences().putBool(KEY_LOADED, historyLoaded);
            preferences().putBool(KEY_LOADED_INIT, true);
        }

        if (historyLoaded) {
            context().getMessagesModule().markAsLoaded(peer);
        }
    }

    @Override
    public void onReceive(Object message) {
        if (message instanceof LoadMore) {
            onLoadMore();
        } else {
            drop(message);
        }
    }

    public static class LoadMore {

    }
}
