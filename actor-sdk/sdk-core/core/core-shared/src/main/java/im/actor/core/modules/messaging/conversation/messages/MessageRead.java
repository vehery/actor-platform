package im.actor.core.modules.messaging.conversation.messages;

public class MessageRead {
    private long date;

    public MessageRead(long date) {
        this.date = date;
    }

    public long getDate() {
        return date;
    }
}
