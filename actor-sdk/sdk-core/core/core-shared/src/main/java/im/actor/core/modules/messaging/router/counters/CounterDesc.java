package im.actor.core.modules.messaging.router.counters;

import im.actor.core.entity.Peer;

public class CounterDesc {

    private Peer peer;
    private int counter;
    private long date;

    public CounterDesc(Peer peer, int counter, long date) {
        this.peer = peer;
        this.counter = counter;
        this.date = date;
    }

    public Peer getPeer() {
        return peer;
    }

    public int getCounter() {
        return counter;
    }

    public long getDate() {
        return date;
    }
}
