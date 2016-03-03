package im.actor.core.modules.messaging.conversation.messages;

import java.util.ArrayList;

import im.actor.core.entity.Reaction;

public class MessageReactionsChanged {

    private long rid;
    private ArrayList<Reaction> reactions;

    public MessageReactionsChanged(long rid, ArrayList<Reaction> reactions) {
        this.rid = rid;
        this.reactions = reactions;
    }

    public ArrayList<Reaction> getReactions() {
        return reactions;
    }

    public long getRid() {
        return rid;
    }
}
