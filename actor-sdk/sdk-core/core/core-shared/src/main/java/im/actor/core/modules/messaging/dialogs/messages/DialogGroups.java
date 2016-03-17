package im.actor.core.modules.messaging.dialogs.messages;

import java.util.ArrayList;
import java.util.HashMap;

import im.actor.core.entity.Peer;

public class DialogGroups {

    private ArrayList<DialogGroup> groups;
    private HashMap<Peer, Integer> counters;

    public DialogGroups(ArrayList<DialogGroup> groups, HashMap<Peer, Integer> counters) {
        this.groups = groups;
        this.counters = counters;
    }

    public ArrayList<DialogGroup> getGroups() {
        return groups;
    }

    public HashMap<Peer, Integer> getCounters() {
        return counters;
    }
}
