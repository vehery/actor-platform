package im.actor.core.modules.messaging.conversation;

import java.util.ArrayList;
import java.util.List;

import im.actor.core.entity.Message;
import im.actor.core.entity.Reaction;
import im.actor.core.entity.content.AbsContent;
import im.actor.core.modules.messaging.conversation.messages.*;
import im.actor.runtime.actors.ActorInterface;
import im.actor.runtime.actors.ActorRef;

public class ConversationInt extends ActorInterface {

    public ConversationInt(ActorRef dest) {
        super(dest);
    }

    public void onMessageContentChanged(long rid, AbsContent content) {
        send(new MessageContentUpdated(rid, content));
    }

    public void onMessages(List<Message> messages) {
        send(new Messages(messages));
    }

    public void onMessage(Message message) {
        send(message);
    }

    public void onHistoryLoaded(List<Message> messages) {
        send(new HistoryLoaded(messages));
    }

    public void onMessageReceived(long date) {
        send(new MessageReceived(date));
    }

    public void onMessageRead(long date) {
        send(new MessageRead(date));
    }

    public void onMessageReadByMe(long date) {
        send(new MessageReadByMe(date));
    }

    public void onMessageSent(long rid, long date) {
        send(new MessageSent(rid, date));
    }

    public void onMessageError(long rid) {
        send(new MessageError(rid));
    }

    public void onMessagesDeleted(List<Long> rids) {
        send(new MessagesDeleted(rids));
    }

    public void onClearConversation() {
        send(new ClearConversation());
    }

    public void onDeleteConversation() {
        send(new DeleteConversation());
    }

    public void onMessageReactionsChanged(long rid, ArrayList<Reaction> reactions) {
        send(new MessageReactionsChanged(rid, reactions));
    }

    public void onConverstionVisible() {
        send(new ConversationVisible());
    }

    public void onConversationHidden() {
        send(new ConversationHidden());
    }
}
