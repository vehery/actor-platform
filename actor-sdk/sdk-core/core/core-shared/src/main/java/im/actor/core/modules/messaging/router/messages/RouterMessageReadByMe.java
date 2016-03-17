package im.actor.core.modules.messaging.router.messages;

import im.actor.core.entity.Peer;

public class RouterMessageReadByMe {
    private Peer peer;
    private long readDate;

    public RouterMessageReadByMe(Peer peer, long readDate) {
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
