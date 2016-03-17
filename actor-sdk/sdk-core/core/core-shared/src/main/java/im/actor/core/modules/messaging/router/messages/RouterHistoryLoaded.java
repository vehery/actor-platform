package im.actor.core.modules.messaging.router.messages;

import java.util.ArrayList;
import java.util.List;

import im.actor.core.entity.Message;
import im.actor.core.entity.Peer;

public class RouterHistoryLoaded {

    private Peer peer;
    private List<Message> messages;

    public RouterHistoryLoaded(Peer peer, List<Message> messages) {
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
