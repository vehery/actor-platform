package im.actor.core.modules.messaging.counters.messages;

import im.actor.core.entity.Peer;

public class CounterInMessage {

    private Peer peer;
    private long rid;
    private long sortDate;

    public CounterInMessage(Peer peer, long rid, long sortDate) {
        this.peer = peer;
        this.rid = rid;
        this.sortDate = sortDate;
    }

    public Peer getPeer() {
        return peer;
    }

    public long getRid() {
        return rid;
    }

    public long getSortDate() {
        return sortDate;
    }
}
