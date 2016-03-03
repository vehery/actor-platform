package im.actor.core.modules.messaging.conversation.messages;

public class MessageSent {
    private long rid;
    private long date;

    public MessageSent(long rid, long date) {
        this.rid = rid;
        this.date = date;
    }

    public long getDate() {
        return date;
    }

    public long getRid() {
        return rid;
    }
}
