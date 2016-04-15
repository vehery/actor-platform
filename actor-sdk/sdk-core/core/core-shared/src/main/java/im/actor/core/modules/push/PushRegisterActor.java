/*
 * Copyright (C) 2015 Actor LLC. <https://actor.im>
 */

package im.actor.core.modules.push;

import java.util.ArrayList;

import im.actor.core.api.ApiEncryptionKey;
import im.actor.core.api.rpc.RequestRegisterActorPush;
import im.actor.core.api.rpc.RequestRegisterApplePush;
import im.actor.core.api.rpc.RequestRegisterApplePushKit;
import im.actor.core.api.rpc.RequestRegisterApplePushToken;
import im.actor.core.api.rpc.RequestRegisterGooglePush;
import im.actor.core.api.rpc.RequestUnregisterApplePush;
import im.actor.core.api.rpc.RequestUnregisterApplePushKit;
import im.actor.core.api.rpc.RequestUnregisterApplePushToken;
import im.actor.core.api.rpc.RequestUnregisterGooglePush;
import im.actor.core.api.rpc.ResponseVoid;
import im.actor.core.modules.ModuleContext;
import im.actor.core.modules.ModuleActor;
import im.actor.core.network.RpcCallback;
import im.actor.core.network.RpcException;
import im.actor.runtime.function.Consumer;

public class PushRegisterActor extends ModuleActor {

    public PushRegisterActor(ModuleContext modules) {
        super(modules);
    }

    @Override
    public void preStart() {
        if (preferences().getBool("push.actor", false)) {
            if (!preferences().getBool("push.actor.registered", false)) {
                String endpoint = preferences().getString("push.actor.endpoint");
                registerActorPush(endpoint);
            }
        }
        if (preferences().getBool("push.google", false)) {
            if (!preferences().getBool("push.google.registered", false)) {
                long projectId = preferences().getLong("push.google.id", 0);
                String token = preferences().getString("push.google.token");
                registerGooglePush(projectId, token);
            }
        }
        if (preferences().getBool("push.apple", false)) {
            if (!preferences().getBool("push.apple.registered", false)) {
                int apnsId = preferences().getInt("push.apple.id", 0);
                String token = preferences().getString("push.apple.token");
                registerApplePush(apnsId, token);
            }
        }
        if (preferences().getBool("push.apple_pushkit", false)) {
            if (!preferences().getBool("push.apple_pushkit.registered", false)) {
                int apnsId = preferences().getInt("push.apple_pushkit.id", 0);
                String token = preferences().getString("push.apple_pushkit.token");
                registerApplePushKit(apnsId, token);
            }
        }
        if (preferences().getBool("push.apple_service", false)) {
            if (!preferences().getBool("push.apple_service.registered", false)) {
                String bundleId = preferences().getString("push.apple_service.id");
                String token = preferences().getString("push.apple_service.token");
                registerApplePushService(bundleId, token);
            }
        }
    }


    //
    // Actor Push
    //

    private void registerActorPush(String endpoint) {

        if (preferences().getBool("push.actor", false)
                && preferences().getBool("push.actor.registered", false)
                && endpoint.equals(preferences().getString("push.actor.endpoint"))) {
            return;
        }

        preferences().putBool("push.actor", true);
        preferences().putBool("push.actor.registered", false);
        preferences().putString("push.actor.endpoint", endpoint);

        api(new RequestRegisterActorPush(endpoint, new ArrayList<ApiEncryptionKey>())).then(new Consumer<ResponseVoid>() {
            @Override
            public void apply(ResponseVoid responseVoid) {
                preferences().putBool("push.actor.registered", true);
            }
        }).done(self());
    }


    //
    // Google Cloud Messaging
    //

    private void registerGooglePush(long projectId, final String token) {

        if (preferences().getBool("push.google", false)
                && preferences().getBool("push.google.registered", false)
                && token.equals(preferences().getString("push.google.token"))
                && projectId == preferences().getLong("push.google.id", 0)) {
            return;
        }

        preferences().putBool("push.google", true);
        preferences().putBool("push.google.registered", false);
        preferences().putLong("push.google.id", projectId);
        preferences().putString("push.google.token", token);

        api(new RequestRegisterGooglePush(projectId, token)).then(new Consumer<ResponseVoid>() {
            @Override
            public void apply(ResponseVoid responseVoid) {
                if (token.equals(preferences().getString("push.google.token"))) {
                    preferences().putBool("push.google.registered", true);
                }
            }
        }).done(self());
    }

    private void unregisterGooglePush(String token) {

        if (token.equals(preferences().getString("push.google.token"))) {
            preferences().putString("push.google.token", "");
            preferences().putBool("push.google", false);
            preferences().putBool("push.google.registered", false);
            preferences().putLong("push.google.id", 0);
        }

        context().getApiModule().performPersistRequest(new RequestUnregisterGooglePush(token));
    }


    //
    // Apple Push Service
    //

    private void registerApplePushService(String bundleId, final String token) {
        if (preferences().getBool("push.apple_service", false)
                && preferences().getBool("push.apple_service.registered", false)
                && token.equals(preferences().getString("push.apple_service.token"))
                && bundleId.equals(preferences().getString("push.apple_service.id"))) {
            return;
        }

        preferences().putBool("push.apple_service", true);
        preferences().putBool("push.apple_service.registered", false);
        preferences().putString("push.apple_service.id", bundleId);
        preferences().putString("push.apple_service.token", token);

        api(new RequestRegisterApplePushToken(bundleId, token)).then(new Consumer<ResponseVoid>() {
            @Override
            public void apply(ResponseVoid responseVoid) {
                if (token.equals(preferences().getString("push.apple_service.token"))) {
                    preferences().putBool("push.apple_service.registered", true);
                }
            }
        }).done(self());

        // Unregistering old push tokens
        unregisterApplePushKit();
        unregisterApplePush();
    }

    private void unregisterApplePushService(String token) {

        if (token.equals(preferences().getString("push.apple_service.token"))) {
            preferences().putString("push.apple_service.token", "");
            preferences().putBool("push.apple_service", false);
            preferences().putBool("push.apple_service.registered", false);
            preferences().putLong("push.apple_service.id", 0);
        }

        context().getApiModule().performPersistRequest(new RequestUnregisterApplePushToken(token));
    }


    //
    // Apple Push Notification System
    //

    private void registerApplePush(int apnsId, final String token) {

        if (preferences().getBool("push.apple", false)
                && preferences().getBool("push.apple.registered", false)
                && token.equals(preferences().getString("push.apple.token"))
                && apnsId == preferences().getInt("push.apple.id", 0)) {
            return;
        }

        preferences().putBool("push.apple", true);
        preferences().putBool("push.apple.registered", false);
        preferences().putInt("push.apple.id", apnsId);
        preferences().putString("push.apple.token", token);

        api(new RequestRegisterApplePush(apnsId, token)).then(new Consumer<ResponseVoid>() {
            @Override
            public void apply(ResponseVoid responseVoid) {
                if (token.equals(preferences().getString("push.apple.token"))) {
                    preferences().putBool("push.apple.registered", true);
                }
            }
        }).done(self());
    }

    private void unregisterApplePush(String token) {

        if (token.equals(preferences().getString("push.apple.token"))) {
            preferences().putString("push.apple.token", "");
            preferences().putBool("push.apple", false);
            preferences().putBool("push.apple.registered", false);
            preferences().putLong("push.apple.id", 0);
        }

        context().getApiModule().performPersistRequest(new RequestUnregisterApplePush(token));
    }

    private void unregisterApplePush() {
        String token = preferences().getString("push.apple.token");
        if (token != null && !"".equals(token)) {
            unregisterApplePush(token);
        }
    }


    //
    // Apple VoIP Services
    //

    private void registerApplePushKit(int apnsId, String token) {

        if (preferences().getBool("push.apple_puskkit", false)
                && preferences().getBool("push.apple_puskkit.registered", false)
                && token.equals(preferences().getString("push.apple_puskkit.token"))
                && apnsId == preferences().getInt("push.apple_puskkit.id", 0)) {
            return;
        }

        preferences().putBool("push.apple_puskkit", true);
        preferences().putBool("push.apple_puskkit.registered", false);
        preferences().putInt("push.apple_puskkit.id", apnsId);
        preferences().putString("push.apple_puskkit.token", token);

        request(new RequestRegisterApplePushKit(apnsId, token), new RpcCallback<ResponseVoid>() {
            @Override
            public void onResult(ResponseVoid response) {
                preferences().putBool("push.apple_puskkit.registered", true);
            }

            @Override
            public void onError(RpcException e) {

            }
        });
    }

    private void unregisterApplePushKit(String token) {
        if (token.equals(preferences().getString("push.apple_puskkit.token"))) {
            preferences().putString("push.apple_puskkit.token", "");
            preferences().putBool("push.apple_puskkit", false);
            preferences().putBool("push.apple_puskkit.registered", false);
            preferences().putLong("push.apple_puskkit.id", 0);
        }

        context().getApiModule().performPersistRequest(new RequestUnregisterApplePushKit(token));
    }

    private void unregisterApplePushKit() {
        String token = preferences().getString("push.apple_puskkit.token");
        if (token != null && !"".equals(token)) {
            unregisterApplePushKit(token);
        }
    }


    //
    // Messages
    //

    @Override
    public void onReceive(Object message) {
        if (message instanceof RegisterGooglePush) {
            RegisterGooglePush registerGooglePush = (RegisterGooglePush) message;
            registerGooglePush(registerGooglePush.getProjectId(),
                    registerGooglePush.getToken());
        } else if (message instanceof UnregisterGooglePush) {
            UnregisterGooglePush unregisterGooglePush = (UnregisterGooglePush) message;
            unregisterGooglePush(unregisterGooglePush.getToken());
        } else if (message instanceof RegisterApplePush) {
            RegisterApplePush applePush = (RegisterApplePush) message;
            registerApplePush(applePush.getApnsKey(), applePush.getToken());
        } else if (message instanceof RegisterAppleVoIPPush) {
            RegisterAppleVoIPPush appleVoipPush = (RegisterAppleVoIPPush) message;
            registerApplePushKit(appleVoipPush.getApnsKey(), appleVoipPush.getToken());
        } else if (message instanceof UnregisterAppleVoIPPush) {
            UnregisterAppleVoIPPush unregisterAppleVoIPPush = (UnregisterAppleVoIPPush) message;
            unregisterApplePushKit(unregisterAppleVoIPPush.getToken());
        } else if (message instanceof RegisterActorPush) {
            RegisterActorPush actorPush = (RegisterActorPush) message;
            registerActorPush(actorPush.getEndpoint());
        } else if (message instanceof UnregisterApplePush) {
            UnregisterApplePush applePush = (UnregisterApplePush) message;
            unregisterApplePush(applePush.getToken());
        } else if (message instanceof RegisterApplePushService) {
            RegisterApplePushService pushService = (RegisterApplePushService) message;
            registerApplePushService(pushService.getBundleId(), pushService.getToken());
        } else if (message instanceof UnregisterApplePushService) {
            UnregisterApplePushService pushService = (UnregisterApplePushService) message;
            unregisterApplePushService(pushService.getToken());
        } else {
            super.onReceive(message);
        }
    }

    public static class RegisterActorPush {

        private String endpoint;

        public RegisterActorPush(String endpoint) {
            this.endpoint = endpoint;
        }

        public String getEndpoint() {
            return endpoint;
        }
    }

    public static class RegisterGooglePush {

        private long projectId;
        private String token;

        public RegisterGooglePush(long projectId, String token) {
            this.projectId = projectId;
            this.token = token;
        }

        public long getProjectId() {
            return projectId;
        }

        public String getToken() {
            return token;
        }
    }

    public static class UnregisterGooglePush {

        private String token;

        public UnregisterGooglePush(String token) {
            this.token = token;
        }

        public String getToken() {
            return token;
        }
    }

    public static class RegisterApplePush {

        private int apnsKey;
        private String token;

        public RegisterApplePush(int apnsKey, String token) {
            this.apnsKey = apnsKey;
            this.token = token;
        }

        public int getApnsKey() {
            return apnsKey;
        }

        public String getToken() {
            return token;
        }
    }

    public static class UnregisterApplePush {

        private String token;

        public UnregisterApplePush(String token) {
            this.token = token;
        }

        public String getToken() {
            return token;
        }
    }

    public static class RegisterAppleVoIPPush {

        private int apnsKey;
        private String token;

        public RegisterAppleVoIPPush(int apnsKey, String token) {
            this.apnsKey = apnsKey;
            this.token = token;
        }

        public int getApnsKey() {
            return apnsKey;
        }

        public String getToken() {
            return token;
        }
    }

    public static class UnregisterAppleVoIPPush {

        private String token;

        public UnregisterAppleVoIPPush(String token) {
            this.token = token;
        }

        public String getToken() {
            return token;
        }
    }

    public static class RegisterApplePushService {

        private String bundleId;
        private String token;

        public RegisterApplePushService(String bundleId, String token) {
            this.bundleId = bundleId;
            this.token = token;
        }

        public String getBundleId() {
            return bundleId;
        }

        public String getToken() {
            return token;
        }
    }

    public static class UnregisterApplePushService {

        private String token;

        public UnregisterApplePushService(String token) {
            this.token = token;
        }

        public String getToken() {
            return token;
        }
    }
}
