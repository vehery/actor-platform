package im.actor.core.modules.messaging.dialogs.messages;

import java.util.List;

import im.actor.core.api.ApiDialogGroup;

public class GroupedDialogsChanged {

    private List<ApiDialogGroup> groups;

    public GroupedDialogsChanged(List<ApiDialogGroup> groups) {
        this.groups = groups;
    }

    public List<ApiDialogGroup> getGroups() {
        return groups;
    }
}
