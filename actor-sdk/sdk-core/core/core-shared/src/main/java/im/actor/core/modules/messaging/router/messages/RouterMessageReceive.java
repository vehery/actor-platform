package im.actor.core.modules.messaging.router.messages;

import im.actor.core.entity.Peer;

public class RouterMessageReceive {
    private Peer peer;
    private long receiveDate;

    public RouterMessageReceive(Peer peer, long receiveDate) {
        this.peer = peer;
        this.receiveDate = receiveDate;
    }

    public Peer getPeer() {
        return peer;
    }

    public long getReceiveDate() {
        return receiveDate;
    }
}
