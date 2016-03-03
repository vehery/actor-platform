package im.actor.core.modules.warmer;

import im.actor.core.modules.AbsModule;
import im.actor.core.modules.ModuleContext;
import im.actor.runtime.actors.Actor;
import im.actor.runtime.actors.ActorCreator;
import im.actor.runtime.actors.ActorRef;

import static im.actor.runtime.actors.ActorSystem.system;

public class WarmerModule extends AbsModule {

    private ActorRef warmerActor;

    public WarmerModule(final ModuleContext context) {
        super(context);

        warmerActor = system().actorOf("actor/warmer", new ActorCreator() {
            @Override
            public Actor create() {
                return new WarmerActor(context);
            }
        });
    }

    public void onContactsLoaded() {
        warmerActor.send(new WarmerActor.OnContactsLoaded());
    }

    public void onDialogsLoaded() {
        warmerActor.send(new WarmerActor.OnDialogsLoaded());
    }

    public void onGroupedDialogsLoaded() {
        warmerActor.send(new WarmerActor.OnGroupedDialogsLoaded());
    }
}
