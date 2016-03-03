/*
 * Copyright (C) 2015 Actor LLC. <https://actor.im>
 */

package im.actor.core.modules.internal.settings;

import java.io.IOException;

import im.actor.core.api.ApiParameter;
import im.actor.core.api.base.SeqUpdate;
import im.actor.core.api.rpc.RequestEditParameter;
import im.actor.core.api.rpc.RequestGetParameters;
import im.actor.core.api.rpc.ResponseGetParameters;
import im.actor.core.api.rpc.ResponseSeq;
import im.actor.core.api.updates.UpdateParameterChanged;
import im.actor.core.modules.ModuleContext;
import im.actor.core.modules.internal.settings.entity.SettingsSyncAction;
import im.actor.core.modules.internal.settings.entity.SettingsSyncState;
import im.actor.core.util.ModuleActor;
import im.actor.core.network.RpcCallback;
import im.actor.core.network.RpcException;
import im.actor.runtime.function.Consumer;

public class SettingsSyncActor extends ModuleActor {

    private static final String SYNC_STATE = "settings_sync_state_v2";
    private static final String SYNC_STATE_LOADED = "settings_sync_state_loaded_v2";

    private SettingsSyncState syncState;

    public SettingsSyncActor(ModuleContext modules) {
        super(modules);
    }

    @Override
    public void preStart() {
        super.preStart();
        syncState = new SettingsSyncState();
        byte[] data = preferences().getBytes(SYNC_STATE);
        if (data != null) {
            try {
                syncState = SettingsSyncState.fromBytes(data);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        for (SettingsSyncAction action : syncState.getPendingActions()) {
            performSync(action);
        }

        if (!preferences().getBool(SYNC_STATE_LOADED, false)) {

            // TODO: Avoid race conditions
            api(new RequestGetParameters()).then(new Consumer<ResponseGetParameters>() {
                @Override
                public void apply(ResponseGetParameters responseGetParameters) {
                    for (ApiParameter p : responseGetParameters.getParameters()) {
                        context().getSettingsModule().onUpdatedSetting(p.getKey(), p.getValue());
                    }
                    preferences().putBool(SYNC_STATE_LOADED, true);
                }
            }).done(self());
        }
    }

    private void performSync(final SettingsSyncAction action) {
        api(new RequestEditParameter(action.getKey(), action.getValue())).then(new Consumer<ResponseSeq>() {
            @Override
            public void apply(ResponseSeq responseSeq) {
                syncState.getPendingActions().remove(action);
                saveState();
                updates().onUpdateReceived(new SeqUpdate(responseSeq.getSeq(), responseSeq.getState(),
                        UpdateParameterChanged.HEADER, new UpdateParameterChanged(action.getKey(), action.getValue()).toByteArray()));
            }
        }).done(self());
    }

    private void saveState() {
        preferences().putBytes(SYNC_STATE, syncState.toByteArray());
    }

    @Override
    public void onReceive(Object message) {
        if (message instanceof ChangeSettings) {
            ChangeSettings changeSettings = (ChangeSettings) message;
            SettingsSyncAction action = new SettingsSyncAction(changeSettings.getKey(),
                    changeSettings.getValue());
            syncState.getPendingActions().add(action);
            saveState();
            performSync(action);
        } else {
            drop(message);
        }
    }

    public static class ChangeSettings {
        private String key;
        private String value;

        public ChangeSettings(String key, String value) {
            this.key = key;
            this.value = value;
        }

        public String getKey() {
            return key;
        }

        public String getValue() {
            return value;
        }
    }
}