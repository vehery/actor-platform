package im.actor.core.modules.messaging.dialogs.messages;

import java.util.List;

import im.actor.core.entity.Peer;

public class DialogGroup {
    private String title;
    private String key;
    private List<Peer> peers;

    public DialogGroup(String title, String key, List<Peer> peers) {
        this.title = title;
        this.key = key;
        this.peers = peers;
    }

    public String getTitle() {
        return title;
    }

    public String getKey() {
        return key;
    }

    public List<Peer> getPeers() {
        return peers;
    }
}
