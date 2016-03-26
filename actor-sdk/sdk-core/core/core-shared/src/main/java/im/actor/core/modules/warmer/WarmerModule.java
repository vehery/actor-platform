package im.actor.core.modules.warmer;

import im.actor.core.modules.AbsModule;
import im.actor.core.modules.ModuleContext;
import im.actor.runtime.actors.Actor;
import im.actor.runtime.actors.ActorCreator;
import im.actor.runtime.actors.ActorRef;

import static im.actor.runtime.actors.ActorSystem.system;

public class WarmerModule extends AbsModule {

    private ActorRef warmerRef;

    public WarmerModule(ModuleContext context) {
        super(context);

        warmerRef = system().actorOf("actor/warmer", new ActorCreator() {
            @Override
            public Actor create() {
                return new WarmerActor(context());
            }
        });
    }

    public void onSequenceStarted() {
        warmerRef.send(new WarmerActor.OnSequenceStarted());
    }
}
