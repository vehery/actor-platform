package im.actor.core.modules.messaging.router;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import im.actor.core.api.ApiDialogGroup;
import im.actor.core.api.ApiMessage;
import im.actor.core.api.ApiPeer;
import im.actor.core.api.updates.UpdateMessage;
import im.actor.core.entity.Group;
import im.actor.core.entity.Message;
import im.actor.core.entity.MessageState;
import im.actor.core.entity.Peer;
import im.actor.core.entity.PeerType;
import im.actor.core.entity.Reaction;
import im.actor.core.entity.User;
import im.actor.core.entity.content.AbsContent;
import im.actor.core.modules.ModuleContext;
import im.actor.core.modules.messaging.router.messages.RouterChatClear;
import im.actor.core.modules.messaging.router.messages.RouterChatClosed;
import im.actor.core.modules.messaging.router.messages.RouterChatDelete;
import im.actor.core.modules.messaging.router.messages.RouterChatOpen;
import im.actor.core.modules.messaging.router.messages.RouterGroupChanged;
import im.actor.core.modules.messaging.router.messages.RouterGroupedChanged;
import im.actor.core.modules.messaging.router.messages.RouterHistoryLoaded;
import im.actor.core.modules.messaging.router.messages.RouterMessageContentChanged;
import im.actor.core.modules.messaging.router.messages.RouterMessageError;
import im.actor.core.modules.messaging.router.messages.RouterMessageReactionsUpdated;
import im.actor.core.modules.messaging.router.messages.RouterMessageRead;
import im.actor.core.modules.messaging.router.messages.RouterMessageReadByMe;
import im.actor.core.modules.messaging.router.messages.RouterMessageReceive;
import im.actor.core.modules.messaging.router.messages.RouterMessageSent;
import im.actor.core.modules.messaging.router.messages.RouterMessages;
import im.actor.core.modules.messaging.router.messages.RouterMessagesDeleted;
import im.actor.core.modules.messaging.router.messages.RouterUserChanged;
import im.actor.runtime.actors.Actor;
import im.actor.runtime.actors.ActorCreator;
import im.actor.runtime.actors.ActorInterface;
import im.actor.runtime.collections.ManagedList;

import static im.actor.core.modules.messaging.entity.EntityConverter.convert;
import static im.actor.runtime.actors.ActorSystem.system;

public class RouterInt extends ActorInterface {

    private ModuleContext context;

    public RouterInt(final ModuleContext context) {
        this.context = context;
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

    public void onMessages(Peer peer, List<Message> messages) {
        if (isValidPeer(peer)) {
            send(new RouterMessages(peer, messages));
        }
    }

    public void onMessages(ApiPeer _peer, List<UpdateMessage> messages) {
        Peer peer = convert(_peer);

        ArrayList<Message> nMessages = new ArrayList<>();
        for (UpdateMessage u : messages) {

            AbsContent msgContent;
            try {
                msgContent = AbsContent.fromMessage(u.getMessage());
            } catch (IOException e) {
                e.printStackTrace();
                continue;
            }

            // Sending message to conversation
            nMessages.add(new Message(u.getRid(), u.getDate(), u.getSenderUid(),
                    MessageState.SENT, msgContent));
        }

        onMessages(peer, nMessages);
    }

    public void onMessage(Peer peer, Message message) {
        onMessages(peer, ManagedList.of(message));
    }

    public void onMessage(ApiPeer _peer, int senderUid, long date, long rid, ApiMessage content) {
        Peer peer = convert(_peer);

        AbsContent msgContent;
        try {
            msgContent = AbsContent.fromMessage(content);
        } catch (IOException e) {
            e.printStackTrace();
            return;
        }

        onMessage(peer, new Message(rid, date, senderUid, MessageState.SENT, msgContent));
    }

    public void onMessagesLoaded(Peer peer, List<Message> messages) {
        if (isValidPeer(peer)) {
            send(new RouterHistoryLoaded(peer, messages));
        }
    }

    //
    // Send States
    //

    public void onMessageSent(Peer peer, long rid, long date) {
        if (isValidPeer(peer)) {
            send(new RouterMessageSent(peer, rid, date));
        }
    }

    public void onMessageError(Peer peer, long rid) {
        if (isValidPeer(peer)) {
            send(new RouterMessageError(peer, rid));
        }
    }


    //
    // Receive State
    //

    public void onChatRead(Peer peer, long readDate) {
        if (isValidPeer(peer)) {
            send(new RouterMessageRead(peer, readDate));
        }
    }

    public void onChatReceive(Peer peer, long receiveDate) {
        if (isValidPeer(peer)) {
            send(new RouterMessageReceive(peer, receiveDate));
        }
    }

    public void onChatReadByMe(Peer peer, long readDate) {
        if (isValidPeer(peer)) {
            send(new RouterMessageReadByMe(peer, readDate));
        }
    }


    //
    // Content Updates
    //

    public void onMessageContentChanged(Peer peer, long rid, AbsContent content) {
        if (isValidPeer(peer)) {
            send(new RouterMessageContentChanged(peer, rid, content));
        }
    }

    public void onMessageReactionsChanged(Peer peer, long rid, List<Reaction> reactions) {
        if (isValidPeer(peer)) {
            send(new RouterMessageReactionsUpdated(peer, rid, reactions));
        }
    }


    //
    // Deletions
    //

    public void onDeletedMessages(Peer peer, List<Long> rids) {
        if (isValidPeer(peer)) {
            send(new RouterMessagesDeleted(peer, rids));
        }
    }

    public void onChatClear(Peer peer) {
        if (isValidPeer(peer)) {
            send(new RouterChatClear(peer));
        }
    }

    public void onChatDelete(Peer peer) {
        if (isValidPeer(peer)) {
            send(new RouterChatDelete(peer));
        }
    }

    public void onChatOpen(Peer peer) {
        if (isValidPeer(peer)) {
            send(new RouterChatOpen(peer));
        }
    }

    public void onChatClosed(Peer peer) {
        if (isValidPeer(peer)) {
            send(new RouterChatClosed(peer));
        }
    }

    //
    // Dialogs
    //

    public void onChatGroupsChanged(List<ApiDialogGroup> groups) {
        send(new RouterGroupedChanged(groups));
    }

    // Peers

    public void onUserChanged(User user) {
        send(new RouterUserChanged(user));
    }

    public void onGroupChanged(Group group) {
        send(new RouterGroupChanged(group));
    }


    //
    // Tools
    //

    private boolean isValidPeer(Peer peer) {
        if (peer.getPeerType() == PeerType.PRIVATE) {
            return context.getUsersModule().getUsersStorage().getValue(peer.getPeerId()) != null;
        } else if (peer.getPeerType() == PeerType.GROUP) {
            return context.getGroupsModule().getGroups().getValue(peer.getPeerId()) != null;
        }
        return false;
    }
}
