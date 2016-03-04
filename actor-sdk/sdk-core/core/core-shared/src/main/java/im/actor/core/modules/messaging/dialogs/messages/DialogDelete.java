package im.actor.core.modules.messaging.dialogs.messages;

import im.actor.core.entity.Peer;

public class DialogDelete {
    private Peer peer;

    public DialogDelete(Peer peer) {
        this.peer = peer;
    }

    public Peer getPeer() {
        return peer;
    }
}
