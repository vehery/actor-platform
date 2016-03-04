package im.actor.core.modules.messaging.counters.messages;

import im.actor.core.entity.Peer;

public class CounterOwnRead {

    private Peer peer;
    private long sortDate;

    public CounterOwnRead(Peer peer, long sortDate) {
        this.peer = peer;
        this.sortDate = sortDate;
    }

    public Peer getPeer() {
        return peer;
    }

    public long getSortDate() {
        return sortDate;
    }
}
