package im.actor.core.modules.messaging.conversation.messages;

public class MessageReceived {
    private long date;

    public MessageReceived(long date) {
        this.date = date;
    }

    public long getDate() {
        return date;
    }
}
