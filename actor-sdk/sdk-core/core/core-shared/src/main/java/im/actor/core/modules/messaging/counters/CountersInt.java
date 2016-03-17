package im.actor.core.modules.messaging.counters;

import java.util.List;

import im.actor.core.api.ApiDialogGroup;
import im.actor.core.modules.ModuleContext;
import im.actor.core.modules.messaging.counters.messages.Counters;
import im.actor.core.modules.messaging.counters.messages.CountersGet;
import im.actor.core.modules.messaging.counters.messages.CountersGroupedUpdated;
import im.actor.core.modules.messaging.dialogs.DialogsInt;
import im.actor.runtime.actors.Actor;
import im.actor.runtime.actors.ActorCreator;
import im.actor.runtime.actors.ActorInterface;
import im.actor.runtime.actors.ActorRef;
import im.actor.runtime.promise.Promise;

import static im.actor.runtime.actors.ActorSystem.system;

public class CountersInt extends ActorInterface {

    public CountersInt(final ModuleContext context) {
        super(system().actorOf("actor/counters", new ActorCreator() {
            @Override
            public Actor create() {
                return new CountersActor(context);
            }
        }));
    }

    public void onGroupedChatsUpdated(List<ApiDialogGroup> groups) {
        send(new CountersGroupedUpdated(groups));
    }

    public Promise<Counters> askCounters() {
        return ask(new CountersGet());
    }
}