package im.actor.core.modules.messaging.dialogs.messages;

import im.actor.core.entity.Peer;

public class DialogReadByMe {

    private Peer peer;
    private long readDate;

    public DialogReadByMe(Peer peer, long readDate) {
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
