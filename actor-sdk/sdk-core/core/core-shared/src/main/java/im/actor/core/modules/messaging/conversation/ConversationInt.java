package im.actor.core.modules.messaging.conversation;

import java.util.List;

import im.actor.core.entity.Message;
import im.actor.core.entity.Reaction;
import im.actor.core.entity.content.AbsContent;
import im.actor.core.modules.messaging.conversation.messages.*;
import im.actor.runtime.actors.ActorInterface;
import im.actor.runtime.actors.ActorRef;
import im.actor.runtime.collections.ManagedList;
import im.actor.runtime.promise.Promise;

public class ConversationInt extends ActorInterface {

    public ConversationInt(ActorRef dest) {
        super(dest);
    }

    public void onMessages(List<Message> messages) {
        send(new Messages(messages));
    }

    public void onMessage(Message message) {
        onMessages(ManagedList.of(message));
    }

    public void onMessageContentChanged(long rid, AbsContent content) {
        send(new MessageContentUpdated(rid, content));
    }

    public void onMessageReactionsChanged(long rid, List<Reaction> reactions) {
        send(new MessageReactionsChanged(rid, reactions));
    }

    public void onHistoryLoaded(List<Message> messages) {
        send(new HistoryLoaded(messages));
    }


    //
    // Message State
    //

    public Promise<Message> onMessageSent(long rid, long date) {
        return ask(new MessageSent(rid, date));
    }

    public void onMessageError(long rid) {
        send(new MessageError(rid));
    }


    //
    // Deletion
    //

    public void onMessagesDeleted(List<Long> rids) {
        send(new MessagesDeleted(rids));
    }

    public void clearChat() {
        send(new ClearConversation());
    }
}
