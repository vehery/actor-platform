package im.actor.core.modules.messaging.router.messages;

import im.actor.core.entity.Peer;
import im.actor.core.entity.content.AbsContent;

public class RouterMessageContentChanged {

    private Peer peer;
    private long rid;
    private AbsContent content;

    public RouterMessageContentChanged(Peer peer, long rid, AbsContent content) {
        this.peer = peer;
        this.rid = rid;
        this.content = content;
    }

    public Peer getPeer() {
        return peer;
    }

    public long getRid() {
        return rid;
    }

    public AbsContent getContent() {
        return content;
    }
}
