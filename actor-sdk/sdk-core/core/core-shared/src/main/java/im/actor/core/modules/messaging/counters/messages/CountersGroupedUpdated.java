package im.actor.core.modules.messaging.counters.messages;

import java.util.List;

import im.actor.core.api.ApiDialogGroup;

public class CountersGroupedUpdated {

    private final List<ApiDialogGroup> groups;

    public CountersGroupedUpdated(List<ApiDialogGroup> groups) {
        this.groups = groups;
    }

    public List<ApiDialogGroup> getGroups() {
        return groups;
    }
}