package im.actor.core.modules.messaging.dialogs.messages;

import im.actor.core.entity.Message;
import im.actor.core.entity.Peer;

public class MessageDeleted {
    private Peer peer;
    private Message topMessage;

    public MessageDeleted(Peer peer, Message topMessage) {
        this.peer = peer;
        this.topMessage = topMessage;
    }

    public Peer getPeer() {
        return peer;
    }

    public Message getTopMessage() {
        return topMessage;
    }
}
