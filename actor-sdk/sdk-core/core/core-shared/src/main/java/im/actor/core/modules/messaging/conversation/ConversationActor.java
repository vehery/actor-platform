/*
 * Copyright (C) 2015 Actor LLC. <https://actor.im>
 */

package im.actor.core.modules.messaging.conversation;

import java.util.List;

import im.actor.core.entity.Message;
import im.actor.core.entity.MessageState;
import im.actor.core.entity.Peer;
import im.actor.core.entity.Reaction;
import im.actor.core.entity.content.AbsContent;
import im.actor.core.entity.content.DocumentContent;
import im.actor.core.modules.ModuleContext;
import im.actor.core.modules.messaging.conversation.messages.ClearConversation;
import im.actor.core.modules.messaging.conversation.messages.HistoryLoaded;
import im.actor.core.modules.messaging.conversation.messages.MessageContentUpdated;
import im.actor.core.modules.messaging.conversation.messages.MessageError;
import im.actor.core.modules.messaging.conversation.messages.MessageReactionsChanged;
import im.actor.core.modules.messaging.conversation.messages.MessageSent;
import im.actor.core.modules.messaging.conversation.messages.Messages;
import im.actor.core.modules.messaging.conversation.messages.MessagesDeleted;
import im.actor.core.util.JavaUtil;
import im.actor.core.util.ModuleActor;
import im.actor.runtime.annotations.Verified;
import im.actor.runtime.collections.ManagedList;
import im.actor.runtime.function.Predicate;
import im.actor.runtime.promise.Promise;
import im.actor.runtime.promise.Promises;
import im.actor.runtime.storage.IoResult;
import im.actor.runtime.storage.ListEngine;

/**
 * Actor for managing Conversation Message list
 */
public class ConversationActor extends ModuleActor {

    private final Peer peer;

    private ListEngine<Message> messages;
    private ListEngine<Message> docs;

    public ConversationActor(Peer peer, ModuleContext context) {
        super(context);
        this.peer = peer;
    }

    @Override
    public void preStart() {
        messages = context().getMessagesModule().getConversationEngine(peer);
        docs = context().getMessagesModule().getConversationDocsEngine(peer);
    }


    //
    // Receiving messages
    //

    @Verified
    private Promise<IoResult> onMessages(List<Message> inMessages, boolean ignorePresent) {

        // Ignore if we already have this message
        // UPDATE: Changed behaviour to providing faster implementation
        // if (messages.getValue(message.getEngineId()) != null) {
        //     return;
        // }

        ManagedList<Message> updatedMessages = ManagedList.of(inMessages);
        if (ignorePresent) {
            updatedMessages = updatedMessages.filter(IS_NOT_PRESENT);
        }
        ManagedList<Message> updatedDocsMessages = updatedMessages.filter(IS_DOCUMENT);

        messages.addOrUpdateItems(updatedMessages);
        docs.addOrUpdateItems(updatedDocsMessages);

        return IoResult.OK();
    }


    //
    // Message Status
    //

    @Verified
    private Promise<Message> onMessageSent(long rid, long date) {
        Message msg = messages.getValue(rid);
        // If we have pending message
        if (msg != null) {
            // Updating message
            Message updatedMsg = msg
                    .changeAllDate(date)
                    .changeState(MessageState.SENT);

            messages.addOrUpdateItem(updatedMsg);
            if (updatedMsg.getContent() instanceof DocumentContent) {
                docs.addOrUpdateItem(updatedMsg);
            }
            return Promises.success(updatedMsg);
        } else {
            return Promises.failure(new RuntimeException("No message found"));
        }
    }

    @Verified
    private void onMessageError(long rid) {
        Message msg = messages.getValue(rid);
        // If we have pending or sent message
        if (msg != null) {

            // Updating message
            Message updatedMsg = msg
                    .changeState(MessageState.ERROR);

            messages.addOrUpdateItem(updatedMsg);
            if (updatedMsg.getContent() instanceof DocumentContent) {
                docs.addOrUpdateItem(updatedMsg);
            }
        }
    }

    //
    // Content Updates
    //

    @Verified
    private void onMessageContentUpdated(long rid, AbsContent content) {
        Message message = messages.getValue(rid);
        // Ignore if we already doesn't have this message
        if (message != null) {

            // Updating message
            Message updatedMsg = message.changeContent(content);
            messages.addOrUpdateItem(updatedMsg);
            if (updatedMsg.getContent() instanceof DocumentContent) {
                docs.addOrUpdateItem(updatedMsg);
            } else if (message.getContent() instanceof DocumentContent) {
                docs.removeItem(rid);
            }
        }
    }

    @Verified
    private void onMessageReactionsUpdated(long rid, List<Reaction> reactions) {

        Message message = messages.getValue(rid);

        if (message != null) {

            Message updatedMsg = message.changeReactions(reactions);

            messages.addOrUpdateItem(updatedMsg);
            if (updatedMsg.getContent() instanceof DocumentContent) {
                docs.addOrUpdateItem(updatedMsg);
            }
        }
    }


    //
    // Deletions
    //

    @Verified
    private Promise<Message> onMessagesDeleted(List<Long> rids) {
        long[] rids2 = JavaUtil.unboxList(rids);

        messages.removeItems(rids2);
        docs.removeItems(rids2);

        return Promises.success(messages.getHeadValue());
    }

    @Verified
    private void onClearConversation() {
        messages.clear();
        docs.clear();
    }


    //
    // Tools
    //

    public final Predicate<Message> IS_DOCUMENT = new Predicate<Message>() {
        @Override
        public boolean apply(Message message) {
            return message.getContent() instanceof DocumentContent;
        }
    };

    public final Predicate<Message> IS_NOT_PRESENT = new Predicate<Message>() {
        @Override
        public boolean apply(Message message) {
            return messages.getValue(message.getRid()) == null;
        }
    };


    // Messages

    @Override
    public void onReceive(Object message) {
        if (message instanceof HistoryLoaded) {
            onMessages(((HistoryLoaded) message).getMessages(), true).done(self());
        } else if (message instanceof MessageContentUpdated) {
            MessageContentUpdated contentUpdated = (MessageContentUpdated) message;
            onMessageContentUpdated(contentUpdated.getRid(), contentUpdated.getContent());
        } else if (message instanceof MessageError) {
            MessageError messageError = (MessageError) message;
            onMessageError(messageError.getRid());
        } else if (message instanceof ClearConversation) {
            onClearConversation();
        } else if (message instanceof MessagesDeleted) {
            onMessagesDeleted(((MessagesDeleted) message).getRids());
        } else if (message instanceof MessageReactionsChanged) {
            onMessageReactionsUpdated(((MessageReactionsChanged) message).getRid(), ((MessageReactionsChanged) message).getReactions());
        } else {
            super.onReceive(message);
        }
    }

    @Override
    public Promise onAsk(Object message) throws Exception {
        if (message instanceof MessageSent) {
            MessageSent messageSent = (MessageSent) message;
            return onMessageSent(messageSent.getRid(), messageSent.getDate());
        } else if (message instanceof MessagesDeleted) {
            MessagesDeleted deleted = (MessagesDeleted) message;
            return onMessagesDeleted(deleted.getRids());
        } else if (message instanceof Messages) {
            return onMessages(((Messages) message).getMessages(), false);
        } else {
            return super.onAsk(message);
        }
    }
}