package im.actor.core.modules.messaging.dialogs.messages;

import im.actor.core.entity.Peer;

public class ChatClear {
    private Peer peer;

    public ChatClear(Peer peer) {
        this.peer = peer;
    }

    public Peer getPeer() {
        return peer;
    }
}
