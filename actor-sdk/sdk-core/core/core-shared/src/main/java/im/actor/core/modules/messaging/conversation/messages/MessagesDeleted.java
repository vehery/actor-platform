package im.actor.core.modules.messaging.conversation.messages;

import java.util.List;

public class MessagesDeleted {
    private List<Long> rids;

    public MessagesDeleted(List<Long> rids) {
        this.rids = rids;
    }

    public List<Long> getRids() {
        return rids;
    }
}
