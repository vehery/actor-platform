package im.actor.core.modules.messaging.counters.messages;

import java.util.HashMap;

import im.actor.core.entity.Peer;

public class CountersDiff {

    private HashMap<Peer, Integer> messages;

    public CountersDiff(HashMap<Peer, Integer> messages) {
        this.messages = messages;
    }

    public HashMap<Peer, Integer> getMessages() {
        return messages;
    }
}
