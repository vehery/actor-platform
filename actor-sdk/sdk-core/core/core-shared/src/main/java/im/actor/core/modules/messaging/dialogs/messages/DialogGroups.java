package im.actor.core.modules.messaging.dialogs.messages;

import java.util.ArrayList;

import im.actor.core.modules.messaging.counters.messages.Counters;

public class DialogGroups {

    private ArrayList<DialogGroup> groups;
    private Counters counters;

    public DialogGroups(ArrayList<DialogGroup> groups, Counters counters) {
        this.groups = groups;
        this.counters = counters;
    }

    public ArrayList<DialogGroup> getGroups() {
        return groups;
    }

    public Counters getCounters() {
        return counters;
    }
}
