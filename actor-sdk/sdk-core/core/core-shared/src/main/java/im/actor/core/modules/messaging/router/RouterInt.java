package im.actor.core.modules.messaging.router;

import java.util.List;

import im.actor.core.api.ApiDialogGroup;
import im.actor.core.modules.ModuleContext;
import im.actor.core.modules.messaging.router.messages.RouterChatGroupsChanged;
import im.actor.runtime.actors.Actor;
import im.actor.runtime.actors.ActorCreator;
import im.actor.runtime.actors.ActorInterface;

import static im.actor.runtime.actors.ActorSystem.system;

public class RouterInt extends ActorInterface {

    private ModuleContext context;

    public RouterInt(final ModuleContext context) {
        this.context = context;
        setDest(system().actorOf("actor/messaging/router", new ActorCreator() {
            @Override
            public Actor create() {
                return new RouterActor(context);
            }
        }));
    }

    public void onChatGroupsChanged(List<ApiDialogGroup> groups) {
        send(new RouterChatGroupsChanged(groups));
    }
}
