package im.actor.core.modules.messaging.conversation.messages;

import im.actor.core.entity.content.AbsContent;

public class MessageContentUpdated {
    private long rid;
    private AbsContent content;

    public MessageContentUpdated(long rid, AbsContent content) {
        this.rid = rid;
        this.content = content;
    }

    public long getRid() {
        return rid;
    }

    public AbsContent getContent() {
        return content;
    }
}
