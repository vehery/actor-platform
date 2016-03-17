package im.actor.core.modules.messaging.router.messages;

import im.actor.core.entity.Peer;

public class RouterChatClosed {

    private Peer peer;

    public RouterChatClosed(Peer peer) {
        this.peer = peer;
    }

    public Peer getPeer() {
        return peer;
    }
}
