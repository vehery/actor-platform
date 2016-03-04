package im.actor.core.modules.messaging.router;

import java.util.List;

import im.actor.core.entity.Message;
import im.actor.core.entity.Peer;
import im.actor.core.entity.Reaction;
import im.actor.core.entity.content.AbsContent;
import im.actor.core.modules.ModuleContext;
import im.actor.core.modules.messaging.router.messages.RouterChatClear;
import im.actor.core.modules.messaging.router.messages.RouterChatDelete;
import im.actor.core.modules.messaging.router.messages.RouterMessageContentChanged;
import im.actor.core.modules.messaging.router.messages.RouterMessageError;
import im.actor.core.modules.messaging.router.messages.RouterMessageReactionsChanged;
import im.actor.core.modules.messaging.router.messages.RouterMessageSent;
import im.actor.core.modules.messaging.router.messages.RouterMessages;
import im.actor.core.modules.messaging.router.messages.RouterMessagesDeleted;
import im.actor.runtime.actors.Actor;
import im.actor.runtime.actors.ActorCreator;
import im.actor.runtime.actors.ActorInterface;
import im.actor.runtime.collections.ManagedList;

import static im.actor.runtime.actors.ActorSystem.system;

public class RouterInt extends ActorInterface {

    public RouterInt(final ModuleContext context) {
        setDest(system().actorOf("actor/messaging/router", new ActorCreator() {
            @Override
            public Actor create() {
                return new RouterActor(context);
            }
        }));
    }


    //
    // Messages
    //

    public void onMessage(Peer peer, Message message) {
        onMessages(peer, ManagedList.of(message));
    }

    public void onMessages(Peer peer, List<Message> messages) {
        send(new RouterMessages(peer, messages));
    }

    public void onMessageSent(Peer peer, long rid, long date) {
        send(new RouterMessageSent(peer, rid, date));
    }

    public void onMessageError(Peer peer, long rid) {
        send(new RouterMessageError(peer, rid));
    }


    //
    // Content Updates
    //

    public void onMessageContentChanged(Peer peer, long rid, AbsContent content) {
        send(new RouterMessageContentChanged(peer, rid, content));
    }

    public void onMessageReactionsChanged(Peer peer, long rid, List<Reaction> reactions) {
        send(new RouterMessageReactionsChanged(peer, rid, reactions));
    }


    //
    // Deletions
    //

    public void onDeletedMessages(Peer peer, List<Long> rids) {
        send(new RouterMessagesDeleted(peer, rids));
    }

    public void onChatClear(Peer peer) {
        send(new RouterChatClear(peer));
    }

    public void onChatDelete(Peer peer) {
        send(new RouterChatDelete(peer));
    }
}
