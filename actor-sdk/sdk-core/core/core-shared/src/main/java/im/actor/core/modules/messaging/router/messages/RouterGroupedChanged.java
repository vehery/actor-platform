package im.actor.core.modules.messaging.router.messages;

import java.util.List;

import im.actor.core.api.ApiDialogGroup;

public class RouterGroupedChanged {

    private List<ApiDialogGroup> groups;

    public RouterGroupedChanged(List<ApiDialogGroup> groups) {
        this.groups = groups;
    }

    public List<ApiDialogGroup> getGroups() {
        return groups;
    }
}
