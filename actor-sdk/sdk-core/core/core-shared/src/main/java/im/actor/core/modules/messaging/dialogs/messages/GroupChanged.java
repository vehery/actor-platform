package im.actor.core.modules.messaging.dialogs.messages;

import im.actor.core.entity.Group;

public class GroupChanged {
    private Group group;

    public GroupChanged(Group group) {
        this.group = group;
    }

    public Group getGroup() {
        return group;
    }
}
