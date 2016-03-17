package im.actor.core.modules.messaging.dialogs;

import java.util.List;

import im.actor.core.api.ApiDialogGroup;
import im.actor.core.entity.Dialog;
import im.actor.core.entity.Group;
import im.actor.core.entity.Message;
import im.actor.core.entity.Peer;
import im.actor.core.entity.User;
import im.actor.core.entity.content.AbsContent;
import im.actor.core.modules.ModuleContext;
import im.actor.core.modules.messaging.counters.messages.Counters;
import im.actor.core.modules.messaging.dialogs.messages.DialogClear;
import im.actor.core.modules.messaging.dialogs.messages.DialogDelete;
import im.actor.core.modules.messaging.dialogs.messages.DialogCounterChanged;
import im.actor.core.modules.messaging.dialogs.messages.DialogGroups;
import im.actor.core.modules.messaging.dialogs.messages.DialogReadByMe;
import im.actor.core.modules.messaging.dialogs.messages.DialogsRead;
import im.actor.core.modules.messaging.dialogs.messages.DialogsReceive;
import im.actor.core.modules.messaging.dialogs.messages.GroupChanged;
import im.actor.core.modules.messaging.dialogs.messages.InMessage;
import im.actor.core.modules.messaging.dialogs.messages.MessageContentChanged;
import im.actor.core.modules.messaging.dialogs.messages.MessageDeleted;
import im.actor.core.modules.messaging.dialogs.messages.UserChanged;
import im.actor.core.viewmodel.DialogGroupsVM;
import im.actor.runtime.Storage;
import im.actor.runtime.actors.Actor;
import im.actor.runtime.actors.ActorCreator;
import im.actor.runtime.actors.ActorInterface;
import im.actor.runtime.actors.ActorRef;
import im.actor.runtime.promise.Promise;
import im.actor.runtime.storage.IoResult;
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
        this.dialogsGroupedActor = system().actorOf("actor/dialogs/grouped", new ActorCreator() {
            @Override
            public DialogsGroupedActor create() {
                return new DialogsGroupedActor(context);
            }
        });

        this.dialogsHistory = system().actorOf("actor/dialogs/history", new ActorCreator() {
            @Override
            public DialogsHistoryActor create() {
                return new DialogsHistoryActor(dialogsActor, context);
            }
        });
    }

    public ListEngine<Dialog> getDialogs() {
        return dialogs;
    }

    public DialogGroupsVM getDialogGroups() {
        return dialogGroups;
    }

    public Promise<IoResult> onInMessage(Peer peer, Message message, int counter) {
        Promise<IoResult> res = ask(new InMessage(peer, message, counter));
        if (dialogsGroupedActor != null) {
            dialogsGroupedActor.send(new DialogsGroupedActor.CounterChanged(peer, counter));
        }
        return res;
    }

    public void onContentChanged(Peer peer, long rid, AbsContent content) {
        dialogsHistory.send(new MessageContentChanged(peer, rid, content));
    }

    public void onCountersChanged(Peer peer, int counter) {
        dialogsHistory.send(new DialogCounterChanged(peer, counter));
        if (dialogsGroupedActor != null) {
            dialogsGroupedActor.send(new DialogsGroupedActor.CounterChanged(peer, counter));
        }
    }

    public void onChatRead(Peer peer, long readDate) {
        dialogsHistory.send(new DialogsRead(peer, readDate));
    }

    public void onChatReadByMe(Peer peer, long readDate) {
        dialogsHistory.send(new DialogReadByMe(peer, readDate));
    }

    public void onChatReceive(Peer peer, long receiveDate) {
        dialogsHistory.send(new DialogsReceive(peer, receiveDate));
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

    public void loadMore() {
        dialogsHistory.send(new DialogsHistoryActor.LoadMore());
    }


    //
    // Entity Updates
    //

    public void onUserChanged(User user) {
        dialogsHistory.send(new UserChanged(user));
        if (dialogsGroupedActor != null) {
            dialogsGroupedActor.send(new DialogsGroupedActor.PeerInformationChanged(user.peer()));
        }
    }

    public void onGroupChanged(Group group) {
        dialogsHistory.send(new GroupChanged(group));
        if (dialogsGroupedActor != null) {
            dialogsGroupedActor.send(new DialogsGroupedActor.PeerInformationChanged(group.peer()));
        }
    }


    //
    // Grouped Dialogs
    //

    public void onGroupsChanged(DialogGroups dialogGroups) {
        if (dialogsGroupedActor != null) {
            dialogsGroupedActor.send(new DialogsGroupedActor
                    .GroupedDialogsChanged(dialogGroups.getGroups(), dialogGroups.getCounters()));
        }
    }
}
