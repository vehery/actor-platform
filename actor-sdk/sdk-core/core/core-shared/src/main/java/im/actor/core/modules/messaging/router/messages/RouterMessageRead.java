package im.actor.core.modules.messaging.router.messages;

import im.actor.core.entity.Peer;

public class RouterMessageRead {
    private Peer peer;
    private long readDate;

    public RouterMessageRead(Peer peer, long readDate) {
        this.peer = peer;
        this.readDate = readDate;
    }

    public Peer getPeer() {
        return peer;
    }

    public long getReadDate() {
        return readDate;
    }
}
