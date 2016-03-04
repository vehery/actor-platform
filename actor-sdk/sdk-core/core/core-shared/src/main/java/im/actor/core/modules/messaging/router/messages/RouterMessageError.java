package im.actor.core.modules.messaging.router.messages;

import im.actor.core.entity.Peer;

public class RouterMessageError {

    private Peer peer;
    private long rid;

    public RouterMessageError(Peer peer, long rid) {
        this.peer = peer;
        this.rid = rid;
    }

    public Peer getPeer() {
        return peer;
    }

    public long getRid() {
        return rid;
    }
}
