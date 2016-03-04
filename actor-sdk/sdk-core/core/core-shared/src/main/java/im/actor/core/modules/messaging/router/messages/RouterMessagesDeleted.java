package im.actor.core.modules.messaging.router.messages;

import java.util.List;

import im.actor.core.entity.Peer;

public class RouterMessagesDeleted {

    private Peer peer;
    private List<Long> rids;

    public RouterMessagesDeleted(Peer peer, List<Long> rids) {
        this.peer = peer;
        this.rids = rids;
    }

    public Peer getPeer() {
        return peer;
    }

    public List<Long> getRids() {
        return rids;
    }
}
