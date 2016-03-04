package im.actor.core.modules.messaging.router.messages;

import im.actor.core.entity.Peer;

public class RouterMessageSent {

    private Peer peer;
    private long rid;
    private long date;

    public RouterMessageSent(Peer peer, long rid, long date) {
        this.peer = peer;
        this.rid = rid;
        this.date = date;
    }

    public Peer getPeer() {
        return peer;
    }

    public long getRid() {
        return rid;
    }

    public long getDate() {
        return date;
    }
}
