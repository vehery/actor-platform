package im.actor.core.modules.messaging.counters;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import im.actor.core.api.ApiDialogGroup;
import im.actor.core.api.ApiDialogShort;
import im.actor.core.entity.Peer;
import im.actor.core.modules.ModuleContext;
import im.actor.core.modules.messaging.counters.entity.CounterEntity;
import im.actor.core.modules.messaging.counters.entity.CountersStorage;
import im.actor.core.modules.messaging.counters.messages.Counters;
import im.actor.core.modules.messaging.counters.messages.CountersGet;
import im.actor.core.modules.messaging.counters.messages.CountersGroupedUpdated;
import im.actor.core.modules.messaging.dialogs.DialogsInt;
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

    public void onGroupedUpdated(List<ApiDialogGroup> groups) {
        for (ApiDialogGroup g : groups) {
            for (ApiDialogShort d : g.getDialogs()) {
                Peer peer = convert(d.getPeer());
                if (d.getCounter() > 0) {
                    storage.getCounters().put(peer, new CounterEntity(peer, d.getCounter()));
                } else {
                    storage.getCounters().remove(peer);
                }
            }
        }
        saveStorage();
    }

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
        if (message instanceof CountersGroupedUpdated) {
            CountersGroupedUpdated countersGroupedUpdated = (CountersGroupedUpdated) message;
            onGroupedUpdated(countersGroupedUpdated.getGroups());
        } else {
            super.onReceive(message);
        }
    }
}