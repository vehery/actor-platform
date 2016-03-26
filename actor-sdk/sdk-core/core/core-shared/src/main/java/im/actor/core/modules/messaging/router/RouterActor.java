package im.actor.core.modules.messaging.router;

import java.util.HashSet;
import java.util.List;

import im.actor.core.api.ApiDialogGroup;
import im.actor.core.entity.Peer;
import im.actor.core.modules.ModuleContext;
import im.actor.core.modules.messaging.conversations.ConversationActor;
import im.actor.core.modules.messaging.dialogs.ActiveDialogsActor;
import im.actor.core.modules.messaging.router.messages.RouterChatClosed;
import im.actor.core.modules.messaging.router.messages.RouterActiveDialogsChanged;
import im.actor.core.modules.messaging.router.messages.RouterChatOpen;
import im.actor.core.util.ModuleActor;

public class RouterActor extends ModuleActor {

    private HashSet<Peer> openedChats = new HashSet<>();

    public RouterActor(ModuleContext context) {
        super(context);
    }

    public void onChatOpen(Peer peer) {
        openedChats.add(peer);

        context().getMessagesModule().getConversationActor(peer)
                .send(new ConversationActor.ConversationVisible());
    }

    public void onChatClosed(Peer peer) {
        openedChats.remove(peer);

        context().getMessagesModule().getConversationActor(peer)
                .send(new ConversationActor.ConversationHidden());
    }

    public void onChatGroupsChanged(List<ApiDialogGroup> groups) {
        context().getMessagesModule().getDialogsGroupedActor()
                .send(new ActiveDialogsActor.ActiveDialogsChanged(groups));
    }

    @Override
    public void onReceive(Object message) {
        if (message instanceof RouterActiveDialogsChanged) {
            RouterActiveDialogsChanged chatGroupsChanged = (RouterActiveDialogsChanged) message;
            onChatGroupsChanged(chatGroupsChanged.getGroups());
        } else if (message instanceof RouterChatOpen) {
            RouterChatOpen chatOpen = (RouterChatOpen) message;
            onChatOpen(chatOpen.getPeer());
        } else if (message instanceof RouterChatClosed) {
            RouterChatClosed chatClosed = (RouterChatClosed) message;
            onChatClosed(chatClosed.getPeer());
        } else {
            super.onReceive(message);
        }
    }
}
