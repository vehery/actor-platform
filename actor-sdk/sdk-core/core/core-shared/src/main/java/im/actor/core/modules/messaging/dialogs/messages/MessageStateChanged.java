package im.actor.core.modules.messaging.dialogs.messages;

import im.actor.core.entity.MessageState;
import im.actor.core.entity.Peer;

public class MessageStateChanged {
    private Peer peer;
    private long rid;
    private MessageState state;

    public MessageStateChanged(Peer peer, long rid, MessageState state) {
        this.peer = peer;
        this.rid = rid;
        this.state = state;
    }

    public Peer getPeer() {
        return peer;
    }

    public long getRid() {
        return rid;
    }

    public MessageState getState() {
        return state;
    }
}
