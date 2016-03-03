package im.actor.core.modules.messaging.conversation.messages;

public class MessageReadByMe {
    private long date;

    public MessageReadByMe(long date) {
        this.date = date;
    }

    public long getDate() {
        return date;
    }
}
