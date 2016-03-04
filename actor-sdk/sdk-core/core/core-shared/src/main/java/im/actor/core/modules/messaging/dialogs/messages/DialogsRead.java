package im.actor.core.modules.messaging.dialogs.messages;

import im.actor.core.entity.Peer;

public class DialogsRead {
    private Peer peer;
    private long readDate;

    public DialogsRead(Peer peer, long readDate) {
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
