package im.actor.core.modules.messaging.dialogs.messages;

import im.actor.core.entity.Peer;

public class ChatDelete {
    private Peer peer;

    public ChatDelete(Peer peer) {
        this.peer = peer;
    }

    public Peer getPeer() {
        return peer;
    }
}
