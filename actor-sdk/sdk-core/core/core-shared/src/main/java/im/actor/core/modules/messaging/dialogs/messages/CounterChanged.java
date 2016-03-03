package im.actor.core.modules.messaging.dialogs.messages;

import im.actor.core.entity.Peer;

public class CounterChanged {
    private Peer peer;
    private int counter;

    public CounterChanged(Peer peer, int counter) {
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
