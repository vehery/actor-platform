package im.actor.core.modules.messaging.conversation.messages;

import java.util.List;

import im.actor.core.entity.Message;
import im.actor.runtime.actors.ask.AskMessage;
import im.actor.runtime.storage.IoResult;

public class Messages implements AskMessage<IoResult> {
    private List<Message> messages;

    public Messages(List<Message> messages) {
        this.messages = messages;
    }

    public List<Message> getMessages() {
        return messages;
    }
}
