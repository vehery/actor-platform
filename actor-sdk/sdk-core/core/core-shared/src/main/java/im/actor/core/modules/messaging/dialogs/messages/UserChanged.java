package im.actor.core.modules.messaging.dialogs.messages;

import im.actor.core.entity.User;

public class UserChanged {
    private User user;

    public UserChanged(User user) {
        this.user = user;
    }

    public User getUser() {
        return user;
    }
}
