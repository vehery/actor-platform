package im.actor.core.modules.messaging.counters;

import im.actor.core.modules.ModuleContext;
import im.actor.core.modules.messaging.dialogs.DialogsInt;
import im.actor.runtime.actors.Actor;
import im.actor.runtime.actors.ActorCreator;
import im.actor.runtime.actors.ActorInterface;
import im.actor.runtime.actors.ActorRef;

import static im.actor.runtime.actors.ActorSystem.system;

public class CountersInt extends ActorInterface {

    private ActorRef countersActor;
    private DialogsInt dialogsInt;

    public CountersInt(final DialogsInt dialogsInt, final ModuleContext context) {
        this.dialogsInt = dialogsInt;
        countersActor = system().actorOf("actor/counters", new ActorCreator() {
            @Override
            public Actor create() {
                return new CountersActor(dialogsInt, context);
            }
        });
        setDest(countersActor);
    }
}