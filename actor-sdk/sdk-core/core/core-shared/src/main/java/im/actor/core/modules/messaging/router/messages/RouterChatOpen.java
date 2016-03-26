package im.actor.core.modules.messaging.router.messages;

import im.actor.core.entity.Peer;

public class RouterChatOpen {
    private Peer peer;

    public RouterChatOpen(Peer peer) {
        this.peer = peer;
    }

    public Peer getPeer() {
        return peer;
    }
}
