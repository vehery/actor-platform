package im.actor.core.modules.messaging.dialogs.messages;

import im.actor.core.entity.Peer;

public class DialogClear {
    private Peer peer;

    public DialogClear(Peer peer) {
        this.peer = peer;
    }

    public Peer getPeer() {
        return peer;
    }
}
