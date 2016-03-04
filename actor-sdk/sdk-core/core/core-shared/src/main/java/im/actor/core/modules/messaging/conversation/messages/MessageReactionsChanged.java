package im.actor.core.modules.messaging.conversation.messages;

import java.util.List;

import im.actor.core.entity.Reaction;

public class MessageReactionsChanged {

    private long rid;
    private List<Reaction> reactions;

    public MessageReactionsChanged(long rid, List<Reaction> reactions) {
        this.rid = rid;
        this.reactions = reactions;
    }

    public List<Reaction> getReactions() {
        return reactions;
    }

    public long getRid() {
        return rid;
    }
}
