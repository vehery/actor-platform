/*
 * Copyright (C) 2015 Actor LLC. <https://actor.im>
 */

package im.actor.core.modules.internal.messages;

import im.actor.core.api.rpc.RequestLoadDialogs;
import im.actor.core.api.rpc.ResponseLoadDialogs;
import im.actor.core.modules.ModuleContext;
import im.actor.core.modules.updates.internal.DialogHistoryLoaded;
import im.actor.core.util.ModuleActor;
import im.actor.core.network.RpcCallback;
import im.actor.core.network.RpcException;
import im.actor.runtime.Log;
import im.actor.runtime.function.Consumer;

public class DialogsHistoryActor extends ModuleActor {

    private static final String TAG = "DialogsHistoryActor";

    private static final int LIMIT = 20;

    private static final String KEY_LOADED_DATE = "dialogs_history_date";
    private static final String KEY_LOADED = "dialogs_history_loaded";
    private static final String KEY_LOADED_INIT = "dialogs_history_inited";

    private long historyMaxDate;
    private boolean historyLoaded;

    private boolean isLoading = false;

    public DialogsHistoryActor(ModuleContext context) {
        super(context);
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
            context().getWarmer().onDialogsLoaded();
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

        Log.d(TAG, "Loading history... after " + historyMaxDate);

        api(new RequestLoadDialogs(historyMaxDate, LIMIT)).then(new Consumer<ResponseLoadDialogs>() {
            @Override
            public void apply(ResponseLoadDialogs responseLoadDialogs) {
                updates().onUpdateReceived(new DialogHistoryLoaded(responseLoadDialogs));
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

        Log.d(TAG, "History loaded, time = " + maxLoadedDate);

        context().getWarmer().onDialogsLoaded();
    }

    // Messages

    @Override
    public void onReceive(Object message) {
        if (message instanceof LoadMore) {
            onLoadMore();
        } else if (message instanceof LoadedMore) {
            LoadedMore loaded = (LoadedMore) message;
            onLoadedMore(loaded.loaded, loaded.maxLoadedDate);
        } else {
            drop(message);
        }
    }

    public static class LoadMore {

    }

    public static class LoadedMore {
        private int loaded;
        private long maxLoadedDate;

        public LoadedMore(int loaded, long maxLoadedDate) {
            this.loaded = loaded;
            this.maxLoadedDate = maxLoadedDate;
        }
    }
}
