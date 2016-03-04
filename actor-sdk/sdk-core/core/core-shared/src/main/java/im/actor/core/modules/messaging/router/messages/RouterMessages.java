package im.actor.core.modules.messaging.router.messages;

import java.util.List;

import im.actor.core.entity.Message;
import im.actor.core.entity.Peer;

public class RouterMessages {

    private final Peer peer;
    private final List<Message> messages;

    public RouterMessages(Peer peer, List<Message> messages) {
        this.peer = peer;
        this.messages = messages;
    }

    public Peer getPeer() {
        return peer;
    }

    public List<Message> getMessages() {
        return messages;
    }
}
