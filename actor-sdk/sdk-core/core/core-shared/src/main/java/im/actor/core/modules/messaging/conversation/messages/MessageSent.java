package im.actor.core.modules.messaging.conversation.messages;

import im.actor.core.entity.Message;
import im.actor.runtime.actors.ask.AskMessage;

public class MessageSent implements AskMessage<Message> {

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
