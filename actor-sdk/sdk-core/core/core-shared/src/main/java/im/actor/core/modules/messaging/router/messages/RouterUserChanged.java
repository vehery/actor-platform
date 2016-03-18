package im.actor.core.modules.messaging.router.messages;

import im.actor.core.entity.User;

public class RouterUserChanged {
    private User user;

    public RouterUserChanged(User user) {
        this.user = user;
    }

    public User getUser() {
        return user;
    }
}
