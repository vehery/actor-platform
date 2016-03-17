package im.actor.core.modules.messaging.counters.messages;

import java.util.HashMap;

import im.actor.core.entity.Peer;

public class Counters {

    private HashMap<Peer, Integer> counters;

    public Counters(HashMap<Peer, Integer> counters) {
        this.counters = counters;
    }

    public HashMap<Peer, Integer> getCounters() {
        return counters;
    }
}
