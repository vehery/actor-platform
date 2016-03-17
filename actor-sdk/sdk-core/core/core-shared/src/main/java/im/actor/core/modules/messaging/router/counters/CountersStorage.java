package im.actor.core.modules.messaging.router.counters;

import java.io.IOException;
import java.util.HashMap;

import im.actor.core.entity.Peer;
import im.actor.runtime.bser.BserObject;
import im.actor.runtime.bser.BserValues;
import im.actor.runtime.bser.BserWriter;

public class CountersStorage extends BserObject {

    private HashMap<Peer, CounterEntity> counters = new HashMap<>();

    public CountersStorage() {
    }

    public CountersStorage(byte[] data) throws IOException {
        load(data);
    }

    public HashMap<Peer, CounterEntity> getCounters() {
        return counters;
    }

    @Override
    public void parse(BserValues values) throws IOException {
        counters.clear();
        for (byte[] b : values.getRepeatedBytes(1)) {
            CounterEntity entity = new CounterEntity(b);
            counters.put(entity.getPeer(), entity);
        }
    }

    @Override
    public void serialize(BserWriter writer) throws IOException {
        writer.writeRepeatedObj(1, counters.values());
    }
}
