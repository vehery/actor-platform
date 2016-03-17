package im.actor.core.modules.messaging.router.counters;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import im.actor.core.entity.Peer;
import im.actor.core.modules.AbsModule;
import im.actor.core.modules.ModuleContext;
import im.actor.core.modules.messaging.router.counters.CounterEntity;
import im.actor.core.modules.messaging.router.counters.CountersStorage;

public class CountersManager extends AbsModule {

    private CountersStorage storage;

    public CountersManager(ModuleContext context) {
        super(context);

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

    public int getCounter(Peer peer) {
        CounterEntity entity = storage.getCounters().get(peer);
        if (entity == null) {
            return 0;
        }
        return entity.getCounter();
    }

    public HashMap<Peer, Integer> getCounters() {
        HashMap<Peer, Integer> counters = new HashMap<>();
        for (Peer p : storage.getCounters().keySet()) {
            int count = storage.getCounters().get(p).getCounter();
            counters.put(p, count);
        }
        return counters;
    }

    public boolean onCountersReceived(ArrayList<CounterDesc> counterDescs) {
        boolean isChanged = false;
        for (CounterDesc desc : counterDescs) {
            Peer peer = desc.getPeer();
            int counter = desc.getCounter();
            long topDate = desc.getDate();
            CounterEntity entity = storage.getCounters().get(desc.getPeer());
            if (counter != 0 && entity == null) {
                storage.getCounters().put(peer, new CounterEntity(peer, counter, topDate));
                isChanged = true;
            } else if (entity != null && entity.getCounter() != counter) {
                storage.getCounters().put(peer, new CounterEntity(peer, counter, topDate));
                isChanged = true;
            } else if (counter == 0 && entity != null) {
                storage.getCounters().remove(peer);
                isChanged = true;
            }
        }
        saveStorage();
        return isChanged;
    }

    public int incrementCounters(Peer peer, int count, long topMessage) {
        int res = getCounter(peer) + count;
        storage.getCounters().put(peer, new CounterEntity(peer, res, topMessage));
        saveStorage();
        return res;
    }

    public long onCountersReset(Peer peer) {
        CounterEntity entity = storage.getCounters().remove(peer);
        if (entity != null) {
            saveStorage();
            return entity.getTopUnreadMessage();
        }
        return -1;
    }

    private void saveStorage() {
        preferences().putBytes("app.counters", storage.toByteArray());
    }
}