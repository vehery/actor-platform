package im.actor.core.modules.messaging.router.messages;

import java.util.List;

import im.actor.core.api.ApiDialogGroup;

public class RouterChatGroupsChanged {

    private List<ApiDialogGroup> groups;

    public RouterChatGroupsChanged(List<ApiDialogGroup> groups) {
        this.groups = groups;
    }

    public List<ApiDialogGroup> getGroups() {
        return groups;
    }
}
