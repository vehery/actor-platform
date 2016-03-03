package im.actor.core.modules.messaging.conversation.messages;

public class MessageError {
    private long rid;

    public MessageError(long rid) {
        this.rid = rid;
    }

    public long getRid() {
        return rid;
    }
}
