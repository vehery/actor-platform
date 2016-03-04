package im.actor.core.modules.messaging.conversation.messages;

import java.util.List;

import im.actor.core.entity.Message;
import im.actor.runtime.actors.ask.AskMessage;

public class MessagesDeleted implements AskMessage<Message> {

    private List<Long> rids;

    public MessagesDeleted(List<Long> rids) {
        this.rids = rids;
    }

    public List<Long> getRids() {
        return rids;
    }
}
