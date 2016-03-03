package im.actor.core.modules.messaging.conversation.messages;

import java.util.List;

import im.actor.core.entity.Message;

public class Messages {
    private List<Message> messages;

    public Messages(List<Message> messages) {
        this.messages = messages;
    }

    public List<Message> getMessages() {
        return messages;
    }
}
