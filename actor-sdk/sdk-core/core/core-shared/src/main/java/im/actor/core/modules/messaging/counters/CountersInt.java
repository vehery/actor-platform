package im.actor.core.modules.messaging.counters;

import java.util.HashMap;

import im.actor.core.entity.Peer;
import im.actor.core.modules.ModuleContext;
import im.actor.core.modules.messaging.counters.messages.Counters;
import im.actor.core.modules.messaging.counters.messages.CountersGet;
import im.actor.core.modules.messaging.counters.messages.CountersDiff;
import im.actor.core.modules.messaging.counters.messages.CountersReceived;
import im.actor.runtime.actors.Actor;
import im.actor.runtime.actors.ActorCreator;
import im.actor.runtime.actors.ActorInterface;
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

    public void onCountersReceived(HashMap<Peer, Integer> counters) {
        send(new CountersReceived(counters));
    }

    public void onIncomingMessages(HashMap<Peer, Integer> messages) {
        send(new CountersDiff(messages));
    }

    public Promise<Counters> askCounters() {
        return ask(new CountersGet());
    }
}