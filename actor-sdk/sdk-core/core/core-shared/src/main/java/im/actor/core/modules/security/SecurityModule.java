/*
 * Copyright (C) 2015 Actor LLC. <https://actor.im>
 */

package im.actor.core.modules.security;

import java.util.List;

import im.actor.core.api.ApiAuthSession;
import im.actor.core.api.rpc.RequestGetAuthSessions;
import im.actor.core.api.rpc.RequestTerminateAllSessions;
import im.actor.core.api.rpc.RequestTerminateSession;
import im.actor.core.api.rpc.ResponseGetAuthSessions;
import im.actor.core.api.rpc.ResponseVoid;
import im.actor.core.modules.AbsModule;
import im.actor.core.modules.ModuleContext;
import im.actor.runtime.function.Function;
import im.actor.runtime.promise.Promise;

public class SecurityModule extends AbsModule {

    public SecurityModule(ModuleContext context) {
        super(context);
    }

    public Promise<List<ApiAuthSession>> loadSessions() {
        return api(new RequestGetAuthSessions()).map(new Function<ResponseGetAuthSessions, List<ApiAuthSession>>() {
            @Override
            public List<ApiAuthSession> apply(ResponseGetAuthSessions responseGetAuthSessions) {
                return responseGetAuthSessions.getUserAuths();
            }
        });
    }

    public Promise<Boolean> terminateAllSessions() {
        return api(new RequestTerminateAllSessions()).map(new Function<ResponseVoid, Boolean>() {
            @Override
            public Boolean apply(ResponseVoid responseVoid) {
                return true;
            }
        });
    }

    public Promise<Boolean> terminateSession(int id) {
        return api(new RequestTerminateSession(id)).map(new Function<ResponseVoid, Boolean>() {
            @Override
            public Boolean apply(ResponseVoid responseVoid) {
                return true;
            }
        });
    }
}
