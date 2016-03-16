/*
 * Copyright (C) 2015 Actor LLC. <https://actor.im>
 */

package im.actor.core.modules.messaging;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import im.actor.core.api.ApiDialogGroup;
import im.actor.core.api.ApiMessage;
import im.actor.core.api.ApiMessageContainer;
import im.actor.core.api.ApiMessageReaction;
import im.actor.core.api.ApiPeer;
import im.actor.core.api.rpc.ResponseLoadArchived;
import im.actor.core.api.rpc.ResponseLoadHistory;
import im.actor.core.api.updates.UpdateMessage;
import im.actor.core.entity.Message;
import im.actor.core.entity.MessageState;
import im.actor.core.entity.Peer;
import im.actor.core.entity.Reaction;
import im.actor.core.entity.content.AbsContent;
import im.actor.core.modules.AbsModule;
import im.actor.core.modules.ModuleContext;
import im.actor.core.modules.messaging.actions.ArchivedDialogsActor;
import im.actor.core.modules.messaging.conversation.ConversationHistoryActor;
import im.actor.core.modules.messaging.entity.EntityConverter;
import im.actor.runtime.Log;

import static im.actor.core.modules.messaging.entity.EntityConverter.convert;

public class MessagesProcessor extends AbsModule {

    public MessagesProcessor(ModuleContext context) {
        super(context);
    }


    //
    // Receiving messages
    //

    public void onMessages(ApiPeer peer, List<UpdateMessage> messages) {
        getRouter().onMessages(peer, messages);
    }

    public void onMessage(ApiPeer _peer, int senderUid, long date, long rid, ApiMessage content) {
        getRouter().onMessage(_peer, senderUid, date, rid, content);
    }

    public void onMessageSent(ApiPeer _peer, long rid, long date) {
        getRouter().onMessageSent(convert(_peer), rid, date);
    }

    public void onReactionsChanged(ApiPeer _peer, long rid, List<ApiMessageReaction> apiReactions) {
        Peer peer = convert(_peer);

        // We are not invalidating sequence because of this update
        if (!isValidPeer(peer)) {
            return;
        }

        ArrayList<Reaction> reactions = new ArrayList<>();
        for (ApiMessageReaction r : apiReactions) {
            reactions.add(new Reaction(r.getCode(), r.getUsers()));
        }

        // Change message state in conversation
        getRouter().onMessageReactionsChanged(peer, rid, reactions);
    }

    public void onMessageContentChanged(ApiPeer _peer, long rid, ApiMessage message) {
        Peer peer = convert(_peer);

        // We are not invalidating sequence because of this update
        if (!isValidPeer(peer)) {
            return;
        }

        AbsContent content;
        try {
            content = AbsContent.fromMessage(message);
        } catch (IOException e) {
            e.printStackTrace();
            return;
        }

        getRouter().onMessageContentChanged(peer, rid, content);
    }


    //
    // Deletion
    //

    public void onMessageDelete(ApiPeer _peer, List<Long> rids) {
        getRouter().onDeletedMessages(convert(_peer), rids);
    }

    public void onChatClear(ApiPeer _peer) {
        getRouter().onChatClear(convert(_peer));
    }

    public void onChatDelete(ApiPeer _peer) {
        getRouter().onChatDelete(convert(_peer));
    }


    //
    // Read State
    //

    public void onMessageRead(ApiPeer _peer, long startDate) {
        getRouter().onChatRead(convert(_peer), startDate);
    }

    public void onMessageReceived(ApiPeer _peer, long startDate) {
        getRouter().onChatReceive(convert(_peer), startDate);
    }

    public void onMessageReadByMe(ApiPeer _peer, long startDate) {
        getRouter().onChatReadByMe(convert(_peer), startDate);
    }


    //
    // Grouped Updates
    //

    public void onChatGroupsChanged(List<ApiDialogGroup> groups) {
        getRouter().onChatGroupsChanged(groups);
    }

//
//    //
//    // Obsolete
//    //
//
//    public void onMessagesLoaded(Peer peer, ResponseLoadHistory historyResponse) {
//        ArrayList<Message> messages = new ArrayList<>();
//        long maxLoadedDate = Long.MAX_VALUE;
//        for (ApiMessageContainer historyMessage : historyResponse.getHistory()) {
//
//            maxLoadedDate = Math.min(historyMessage.getDate(), maxLoadedDate);
//
//            AbsContent content = null;
//            try {
//                content = AbsContent.fromMessage(historyMessage.getMessage());
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//            if (content == null) {
//                continue;
//            }
//            MessageState state = EntityConverter.convert(historyMessage.getState());
//
//            ArrayList<Reaction> reactions = new ArrayList<>();
//
//            for (ApiMessageReaction r : historyMessage.getReactions()) {
//                reactions.add(new Reaction(r.getCode(), r.getUsers()));
//            }
//
//            messages.add(new Message(historyMessage.getRid(), historyMessage.getDate(),
//                    historyMessage.getDate(), historyMessage.getSenderUid(),
//                    state, content, reactions));
//        }
//
//        // Sending updates to conversation actor
//        if (messages.size() > 0) {
//            // conversationActor(peer).onHistoryLoaded(messages);
//        }
//
//        // Sending notification to conversation history actor
//        conversationHistoryActor(peer).send(new ConversationHistoryActor.LoadedMore(historyResponse.getHistory().size(),
//                maxLoadedDate));
//    }
//
//    public void onArchivedDialogsLoaded(ResponseLoadArchived responseLoadArchived) {
//        archivedDialogsActor().send(new ArchivedDialogsActor.LoadedMore(responseLoadArchived));
//    }
}
