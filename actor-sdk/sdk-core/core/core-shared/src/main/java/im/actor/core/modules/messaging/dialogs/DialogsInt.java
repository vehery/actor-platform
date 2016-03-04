package im.actor.core.modules.messaging.dialogs;

import java.util.List;

import im.actor.core.api.ApiDialogGroup;
import im.actor.core.entity.Dialog;
import im.actor.core.entity.Group;
import im.actor.core.entity.Message;
import im.actor.core.entity.MessageState;
import im.actor.core.entity.Peer;
import im.actor.core.entity.User;
import im.actor.core.entity.content.AbsContent;
import im.actor.core.modules.ModuleContext;
import im.actor.core.modules.messaging.dialogs.messages.DialogClear;
import im.actor.core.modules.messaging.dialogs.messages.DialogDelete;
import im.actor.core.modules.messaging.dialogs.messages.DialogCounterChanged;
import im.actor.core.modules.messaging.dialogs.messages.GroupChanged;
import im.actor.core.modules.messaging.dialogs.messages.InMessage;
import im.actor.core.modules.messaging.dialogs.messages.MessageContentChanged;
import im.actor.core.modules.messaging.dialogs.messages.MessageDeleted;
import im.actor.core.modules.messaging.dialogs.messages.MessageStateChanged;
import im.actor.core.modules.messaging.dialogs.messages.UserChanged;
import im.actor.core.viewmodel.DialogGroupsVM;
import im.actor.runtime.Storage;
import im.actor.runtime.actors.Actor;
import im.actor.runtime.actors.ActorCreator;
import im.actor.runtime.actors.ActorInterface;
import im.actor.runtime.actors.ActorRef;
import im.actor.runtime.storage.ListEngine;

import static im.actor.runtime.actors.ActorSystem.system;

public class DialogsInt extends ActorInterface {

    private final ListEngine<Dialog> dialogs;
    private final DialogGroupsVM dialogGroups;
    private final ActorRef dialogsHistory;
    private final ActorRef dialogsActor;
    private final ActorRef dialogsGroupedActor;

    public DialogsInt(final ModuleContext context) {
        this.dialogs = Storage.createList("dialogs", Dialog.CREATOR);
        this.dialogGroups = new DialogGroupsVM();
        this.dialogsActor = system().actorOf("actor/dialogs", new ActorCreator() {
            @Override
            public Actor create() {
                return new DialogsActor(dialogs, context);
            }
        });
        this.dialogsHistory = system().actorOf("actor/dialogs/history", new ActorCreator() {
            @Override
            public DialogsHistoryActor create() {
                return new DialogsHistoryActor(dialogsActor, context);
            }
        });

        if (context.getConfiguration().isEnabledGroupedChatList()) {
            this.dialogsGroupedActor = system().actorOf("actor/dialogs/grouped", new ActorCreator() {
                @Override
                public DialogsGroupedActor create() {
                    return new DialogsGroupedActor(context);
                }
            });
        } else {
            this.dialogsGroupedActor = null;
        }
    }

    public ListEngine<Dialog> getDialogs() {
        return dialogs;
    }

    public DialogGroupsVM getDialogGroups() {
        return dialogGroups;
    }

    public void onInMessage(Peer peer, Message message, int counter) {
        dialogsHistory.send(new InMessage(peer, message, counter));
        if (dialogsGroupedActor != null) {
            dialogsGroupedActor.send(new DialogsGroupedActor.CounterChanged(peer, counter));
        }
    }

    public void onContentChanged(Peer peer, long rid, AbsContent content) {
        dialogsHistory.send(new MessageContentChanged(peer, rid, content));
    }

    public void onMessageStateChanged(Peer peer, long rid, MessageState state) {
        dialogsHistory.send(new MessageStateChanged(peer, rid, state));
    }

    public void onCountersChanged(Peer peer, int counter) {
        dialogsHistory.send(new DialogCounterChanged(peer, counter));
        if (dialogsGroupedActor != null) {
            dialogsGroupedActor.send(new DialogsGroupedActor.CounterChanged(peer, counter));
        }
    }

    public void onMessageDeleted(Peer peer, Message topMessage) {
        dialogsHistory.send(new MessageDeleted(peer, topMessage));
    }

    public void onChatClear(Peer peer) {
        dialogsHistory.send(new DialogClear(peer));
    }

    public void onChatDeleted(Peer peer) {
        dialogsHistory.send(new DialogDelete(peer));
    }

    public void onGroupChanged(Group group) {
        dialogsHistory.send(new GroupChanged(group));
        if (dialogsGroupedActor != null) {
            dialogsGroupedActor.send(new DialogsGroupedActor.PeerInformationChanged(group.peer()));
        }
    }

    public void onUserChanged(User user) {
        dialogsHistory.send(new UserChanged(user));
        if (dialogsGroupedActor != null) {
            dialogsGroupedActor.send(new DialogsGroupedActor.PeerInformationChanged(user.peer()));
        }
    }

    public void loadMore() {
        dialogsHistory.send(new DialogsHistoryActor.LoadMore());
    }

    public void onGroupsChanged(List<ApiDialogGroup> groups) {
        if (dialogsGroupedActor != null) {
            dialogsGroupedActor.send(new DialogsGroupedActor.GroupedDialogsChanged(groups));
        }
    }
}
