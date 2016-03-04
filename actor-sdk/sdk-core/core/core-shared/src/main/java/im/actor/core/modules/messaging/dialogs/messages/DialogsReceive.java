package im.actor.core.modules.messaging.dialogs.messages;

import im.actor.core.entity.Peer;

public class DialogsReceive {
    private Peer peer;
    private long receiveDate;

    public DialogsReceive(Peer peer, long receiveDate) {
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
