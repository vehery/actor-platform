package im.actor.core.modules.messaging.counters.entity;

import java.io.IOException;

import im.actor.core.entity.Peer;
import im.actor.runtime.bser.BserObject;
import im.actor.runtime.bser.BserValues;
import im.actor.runtime.bser.BserWriter;

public class CounterEntity extends BserObject {

    private Peer peer;
    private int counter;

    public CounterEntity(Peer peer, int counter) {
        this.peer = peer;
        this.counter = counter;
    }

    public CounterEntity(byte[] data) throws IOException {
        load(data);
    }

    public Peer getPeer() {
        return peer;
    }

    public int getCounter() {
        return counter;
    }

    @Override
    public void parse(BserValues values) throws IOException {
        peer = Peer.fromBytes(values.getBytes(1));
        counter = values.getInt(2);
    }

    @Override
    public void serialize(BserWriter writer) throws IOException {
        writer.writeObject(1, peer);
        writer.writeInt(2, counter);
    }
}
