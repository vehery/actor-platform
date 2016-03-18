package im.actor.core.modules.messaging.router.messages;

import im.actor.core.entity.Group;

public class RouterGroupChanged {
    private Group group;

    public RouterGroupChanged(Group group) {
        this.group = group;
    }

    public Group getGroup() {
        return group;
    }
}
