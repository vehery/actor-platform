package im.actor.core.modules.messaging.dialogs;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import im.actor.core.api.rpc.RequestLoadGroupedDialogs;
import im.actor.core.api.rpc.ResponseLoadGroupedDialogs;
import im.actor.core.entity.Avatar;
import im.actor.core.entity.DialogSpec;
import im.actor.core.entity.Group;
import im.actor.core.entity.Peer;
import im.actor.core.entity.PeerType;
import im.actor.core.entity.User;
import im.actor.core.modules.ModuleContext;
import im.actor.core.modules.messaging.counters.messages.Counters;
import im.actor.core.modules.messaging.dialogs.messages.DialogGroup;
import im.actor.core.modules.messaging.entity.GroupedItem;
import im.actor.core.modules.messaging.entity.GroupedStorage;
import im.actor.core.util.ModuleActor;
import im.actor.core.viewmodel.DialogGroupVM;
import im.actor.core.viewmodel.DialogSmall;
import im.actor.core.viewmodel.DialogSpecVM;
import im.actor.core.viewmodel.generics.ArrayListDialogSmall;
import im.actor.runtime.function.Consumer;
import im.actor.runtime.mvvm.MVVMCollection;

public class DialogsGroupedActor extends ModuleActor {

    private static final String PREFERENCE_GROUPED = "dialogs.grouped";
    private static final String PREFERENCE_GROUPED_LOADED = "dialogs.grouped.loaded";

    private GroupedStorage storage;
    private MVVMCollection<DialogSpec, DialogSpecVM> specs;
    private boolean isStarted;

    public DialogsGroupedActor(ModuleContext context) {
        super(context);
    }

    @Override
    public void preStart() {
        super.preStart();
        specs = context().getMessagesModule().getDialogDescKeyValue();
        storage = new GroupedStorage();

        if (isPersistenceEnabled()) {
            byte[] data = preferences().getBytes(PREFERENCE_GROUPED);
            if (data != null) {
                try {
                    storage = new GroupedStorage(data);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            boolean isLoaded = preferences().getBool(PREFERENCE_GROUPED_LOADED, false);
            if (!isLoaded) {
                loadGroupedDialogs();
            } else {
                isStarted = true;
                notifyVM();
            }
        } else {
            loadGroupedDialogs();
        }
    }

    private void loadGroupedDialogs() {
        api(new RequestLoadGroupedDialogs()).then(new Consumer<ResponseLoadGroupedDialogs>() {
            @Override
            public void apply(final ResponseLoadGroupedDialogs response) {
                updates().executeRelatedResponse(response.getUsers(), response.getGroups(), self(), new Runnable() {
                    @Override
                    public void run() {
                        context().getMessagesModule().getRouter().onChatGroupsChanged(response.getDialogs());
                    }
                });
            }
        }).done(self());
    }

    //
    //
    //

    private void onCounterChanged(Peer peer, int counter) {
        if (isStarted) {
            DialogSpec spec = new DialogSpec(peer, false, counter);
            specs.getEngine().addOrUpdateItem(spec);
            notifyVM(peer);
        } else {
            stash();
        }
    }

    private void onPeerInfoChanged(Peer peer) {
        if (isStarted) {
            notifyVM(peer);
        } else {
            stash();
        }
    }

    private void onGroupedChanged(List<DialogGroup> groupedItems, Counters counters) {
        if (!isStarted) {
            isStarted = true;
            if (isPersistenceEnabled()) {
                preferences().putBool(PREFERENCE_GROUPED_LOADED, true);
            }
            unstashAll();
        }
        applyGroups(groupedItems, counters);
    }


    //
    // Tools
    //

    private void notifyVM(Peer peer) {
        boolean found = false;
        for (GroupedItem i : storage.getGroups()) {
            for (Peer p : i.getPeers()) {
                if (p.equals(peer)) {
                    found = true;
                    break;
                }
            }
        }

        if (found) {
            notifyVM();
        }
    }

    private void notifyVM() {
        ArrayList<DialogGroupVM> groups = new ArrayList<>();
        for (GroupedItem i : storage.getGroups()) {
            ArrayListDialogSmall dialogSmalls = new ArrayListDialogSmall();
            for (Peer p : i.getPeers()) {

                String title;
                Avatar avatar;
                if (p.getPeerType() == PeerType.GROUP) {
                    Group group = getGroup(p.getPeerId());
                    title = group.getTitle();
                    avatar = group.getAvatar();
                } else if (p.getPeerType() == PeerType.PRIVATE) {
                    User user = getUser(p.getPeerId());
                    title = user.getName();
                    avatar = user.getAvatar();
                } else {
                    continue;
                }
                DialogSpec spec = specs.getEngine().getValue(p.getUnuqueId());
                if (spec != null) {
                    dialogSmalls.add(new DialogSmall(p, title, avatar, spec.getCounter()));
                } else {
                    dialogSmalls.add(new DialogSmall(p, title, avatar, 0));
                }
            }
            groups.add(new DialogGroupVM(i.getTitle(), i.getKey(), dialogSmalls));
        }
        context().getMessagesModule().getDialogGroupsVM().getGroupsValueModel().change(groups);
        context().getWarmer().onGroupedDialogsLoaded();
    }

    private void applyGroups(List<DialogGroup> dialogGroups, Counters counters) {

        // Writing missing specs

        ArrayList<DialogSpec> updatedSpecs = new ArrayList<>();
        for (Peer peer : counters.getCounters().keySet()) {
            int counter = counters.getCounters().get(peer);
            updatedSpecs.add(new DialogSpec(peer, false, counter));
        }
        specs.getEngine().addOrUpdateItems(updatedSpecs);

        // Updating storage

        storage.getGroups().clear();
        for (DialogGroup g : dialogGroups) {
            storage.getGroups().add(new GroupedItem(g.getKey(), g.getTitle(), g.getPeers()));
        }
        if (isPersistenceEnabled()) {
            preferences().putBytes(PREFERENCE_GROUPED, storage.toByteArray());
        }

        // Updating VM

        notifyVM();
    }


    //
    // Messages
    //

    @Override
    public void onReceive(Object message) {
        if (message instanceof PeerInformationChanged) {
            PeerInformationChanged informationChanged = (PeerInformationChanged) message;
            onPeerInfoChanged(informationChanged.getPeer());
        } else if (message instanceof CounterChanged) {
            CounterChanged counterChanged = (CounterChanged) message;
            onCounterChanged(counterChanged.getPeer(), counterChanged.getCounter());
        } else if (message instanceof GroupedDialogsChanged) {
            GroupedDialogsChanged g = (GroupedDialogsChanged) message;
            onGroupedChanged(g.getItems(), g.getCounters());
        } else {
            super.onReceive(message);
        }
    }

    public static class GroupedDialogsChanged {

        private List<DialogGroup> items;
        private Counters counters;

        public GroupedDialogsChanged(List<DialogGroup> items, Counters counters) {
            this.items = items;
            this.counters = counters;
        }

        public List<DialogGroup> getItems() {
            return items;
        }

        public Counters getCounters() {
            return counters;
        }
    }

    public static class PeerInformationChanged {

        private Peer peer;

        public PeerInformationChanged(Peer peer) {
            this.peer = peer;
        }

        public Peer getPeer() {
            return peer;
        }

    }

    public static class CounterChanged {

        private Peer peer;
        private int counter;

        public CounterChanged(Peer peer, int counter) {
            this.peer = peer;
            this.counter = counter;
        }

        public Peer getPeer() {
            return peer;
        }

        public int getCounter() {
            return counter;
        }
    }
}