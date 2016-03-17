package im.actor.core.modules.messaging.counters;

import java.io.IOException;
import java.util.HashMap;

import im.actor.core.entity.Peer;
import im.actor.core.modules.ModuleContext;
import im.actor.core.modules.messaging.counters.entity.CounterEntity;
import im.actor.core.modules.messaging.counters.entity.CountersStorage;
import im.actor.core.modules.messaging.counters.messages.Counters;
import im.actor.core.modules.messaging.counters.messages.CountersGet;
import im.actor.core.modules.messaging.counters.messages.CountersReceived;
import im.actor.core.util.ModuleActor;
import im.actor.runtime.promise.Promise;
import im.actor.runtime.promise.Promises;

import static im.actor.core.modules.messaging.entity.EntityConverter.convert;

public class CountersActor extends ModuleActor {

    private CountersStorage storage;

    public CountersActor(ModuleContext context) {
        super(context);
    }

    @Override
    public void preStart() {
        super.preStart();
        storage = new CountersStorage();

        byte[] counters = preferences().getBytes("app.counters");
        if (counters != null) {
            try {
                storage = new CountersStorage(counters);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public void onCountersReceived(HashMap<Peer, Integer> counters) {
        for (Peer p : counters.keySet()) {
            int counter = counters.get(p);
            if (counter > 0) {
                storage.getCounters().put(p, new CounterEntity(p, counter));
            } else {
                storage.getCounters().remove(p);
            }
        }
        saveStorage();
    }

    public void onInMessage

    public Counters getCounters() {
        HashMap<Peer, Integer> counters = new HashMap<>();
        for (Peer p : storage.getCounters().keySet()) {
            int counter = storage.getCounters().get(p).getCounter();
            counters.put(p, counter);
        }
        return new Counters(counters);
    }

    private void saveStorage() {
        preferences().putBytes("app.counters", storage.toByteArray());
    }

    @Override
    public Promise onAsk(Object message) throws Exception {
        if (message instanceof CountersGet) {
            return Promises.success(getCounters());
        } else {
            return super.onAsk(message);
        }
    }

    @Override
    public void onReceive(Object message) {
        if (message instanceof CountersReceived) {
            CountersReceived received = (CountersReceived) message;
            onCountersReceived(received.getCounters());
        } else {
            super.onReceive(message);
        }
    }
}