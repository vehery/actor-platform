package im.actor.core.modules.messaging.dialogs.messages;

import im.actor.core.entity.Peer;

public class DialogCounterChanged {
    private Peer peer;
    private int counter;

    public DialogCounterChanged(Peer peer, int counter) {
        this.peer = peer;
        this.counter = counter;
    }

    public Peer getPeer() {
        return peer;
    }

    public int getCounter() {
        return counter;
    }
}
