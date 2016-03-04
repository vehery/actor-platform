package im.actor.core.modules.messaging.router;

import java.util.ArrayList;
import java.util.List;

import im.actor.core.entity.Message;
import im.actor.core.entity.Peer;
import im.actor.core.entity.Reaction;
import im.actor.core.entity.content.AbsContent;
import im.actor.core.modules.ModuleContext;
import im.actor.core.modules.messaging.conversation.ConversationInt;
import im.actor.core.modules.messaging.dialogs.DialogsInt;
import im.actor.core.modules.messaging.router.messages.RouterChatClear;
import im.actor.core.modules.messaging.router.messages.RouterChatDelete;
import im.actor.core.modules.messaging.router.messages.RouterMessageContentChanged;
import im.actor.core.modules.messaging.router.messages.RouterMessageError;
import im.actor.core.modules.messaging.router.messages.RouterMessageReactionsChanged;
import im.actor.core.modules.messaging.router.messages.RouterMessageRead;
import im.actor.core.modules.messaging.router.messages.RouterMessageReceive;
import im.actor.core.modules.messaging.router.messages.RouterMessageSent;
import im.actor.core.modules.messaging.router.messages.RouterMessages;
import im.actor.core.modules.messaging.router.messages.RouterMessagesDeleted;
import im.actor.core.util.ModuleActor;
import im.actor.runtime.*;
import im.actor.runtime.function.Consumer;
import im.actor.runtime.promise.Promise;
import im.actor.runtime.promise.PromisesArray;
import im.actor.runtime.storage.IoResult;

public class RouterActor extends ModuleActor {

    public RouterActor(ModuleContext context) {
        super(context);
    }


    //
    // Messages
    //

    public void onMessages(Peer peer, List<Message> messages) {
        final long start = im.actor.runtime.Runtime.getActorTime();
        Message topServerMessage = null;
        for (Message m : messages) {
            if (m.isOnServer()) {
                if (topServerMessage == null || m.getSortDate() > topServerMessage.getSortDate()) {
                    topServerMessage = m;
                }
            }
        }
        ArrayList<Promise<IoResult>> results = new ArrayList<>();

        if (topServerMessage != null) {
            results.add(dialogs().onInMessage(peer, topServerMessage, -1));
        }
        results.add(chat(peer).onMessages(messages));

        PromisesArray.ofPromises(results).zipIo().then(new Consumer<IoResult>() {
            @Override
            public void apply(IoResult ioResult) {
                Log.d("Router", "onMessages: " + (im.actor.runtime.Runtime.getActorTime() - start) + " ms");
            }
        }).done(self());
    }


    //
    // Message States
    //

    public void onMessageSent(final Peer peer, final long rid, long date) {
        chat(peer).onMessageSent(rid, date).then(new Consumer<Message>() {
            @Override
            public void apply(Message message) {
                dialogs().onInMessage(peer, message, -1);
            }
        }).done(self());
    }

    public void onMessageError(Peer peer, long rid) {
        chat(peer).onMessageError(rid);
    }


    //
    // Receive States
    //

    public void onChatRead(Peer peer, long date) {
        dialogs().onChatRead(peer, date);
    }

    public void onChatReceive(Peer peer, long date) {
        dialogs().onChatReceive(peer, date);
    }


    //
    // Content updating
    //

    public void onMessageContentChanged(Peer peer, long rid, AbsContent content) {
        chat(peer).onMessageContentChanged(rid, content);
        dialogs().onContentChanged(peer, rid, content);
    }

    public void onReactionsChanged(Peer peer, long rid, List<Reaction> reactions) {
        chat(peer).onMessageReactionsChanged(rid, reactions);
    }


    //
    // Deletion
    //

    public void onChatDelete(Peer peer) {
        dialogs().onChatDeleted(peer);
        chat(peer).clearChat();
    }

    public void onChatClear(Peer peer) {
        dialogs().onChatClear(peer);
        chat(peer).clearChat();
    }

    public void onDeleted(final Peer peer, List<Long> rids) {
        chat(peer).onMessagesDeleted(rids).then(new Consumer<Message>() {
            @Override
            public void apply(Message message) {
                dialogs().onMessageDeleted(peer, message);
            }
        }).done(self());
    }


    //
    // Tools
    //

    private ConversationInt chat(Peer peer) {
        return context().getMessagesModule().getConversationActor(peer);
    }

    private DialogsInt dialogs() {
        return getDialogs();
    }


    //
    // Messages
    //

    @Override
    public void onReceive(Object message) {
        if (message instanceof RouterMessages) {
            RouterMessages inMessages = (RouterMessages) message;
            onMessages(inMessages.getPeer(), inMessages.getMessages());
        } else if (message instanceof RouterMessageSent) {
            RouterMessageSent messageSent = (RouterMessageSent) message;
            onMessageSent(messageSent.getPeer(), messageSent.getRid(), messageSent.getDate());
        } else if (message instanceof RouterMessageError) {
            RouterMessageError messageError = (RouterMessageError) message;
            onMessageError(messageError.getPeer(), messageError.getRid());
        } else if (message instanceof RouterMessageContentChanged) {
            RouterMessageContentChanged contentChanged = (RouterMessageContentChanged) message;
            onMessageContentChanged(contentChanged.getPeer(), contentChanged.getRid(),
                    contentChanged.getContent());
        } else if (message instanceof RouterMessageReactionsChanged) {
            RouterMessageReactionsChanged reactionsChanged = (RouterMessageReactionsChanged) message;
            onReactionsChanged(reactionsChanged.getPeer(), reactionsChanged.getRid(), reactionsChanged.getReactions());
        } else if (message instanceof RouterChatClear) {
            RouterChatClear chatClear = (RouterChatClear) message;
            onChatClear(chatClear.getPeer());
        } else if (message instanceof RouterChatDelete) {
            RouterChatDelete chatDelete = (RouterChatDelete) message;
            onChatDelete(chatDelete.getPeer());
        } else if (message instanceof RouterMessagesDeleted) {
            RouterMessagesDeleted messagesDeleted = (RouterMessagesDeleted) message;
            onDeleted(messagesDeleted.getPeer(), messagesDeleted.getRids());
        } else if (message instanceof RouterMessageReceive) {
            RouterMessageReceive messageReceive = (RouterMessageReceive) message;
            onChatReceive(messageReceive.getPeer(), messageReceive.getReceiveDate());
        } else if (message instanceof RouterMessageRead) {
            RouterMessageRead messageRead = (RouterMessageRead) message;
            onChatRead(messageRead.getPeer(), messageRead.getReadDate());
        } else {
            super.onReceive(message);
        }
    }
}
