package im.actor.core.modules.messaging.counters.messages;

import java.util.HashMap;

import im.actor.core.entity.Peer;

public class CountersReceived {

    private HashMap<Peer, Integer> counters = new HashMap<>();

    public CountersReceived(HashMap<Peer, Integer> counters) {
        this.counters = counters;
    }

    public HashMap<Peer, Integer> getCounters() {
        return counters;
    }
}
