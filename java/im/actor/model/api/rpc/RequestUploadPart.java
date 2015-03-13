package im.actor.model.api.rpc;
/*
 *  Generated by the Actor API Scheme generator.  DO NOT EDIT!
 */

import im.actor.model.droidkit.bser.Bser;
import im.actor.model.droidkit.bser.BserParser;
import im.actor.model.droidkit.bser.BserObject;
import im.actor.model.droidkit.bser.BserValues;
import im.actor.model.droidkit.bser.BserWriter;
import im.actor.model.droidkit.bser.DataInput;
import im.actor.model.droidkit.bser.DataOutput;
import static im.actor.model.droidkit.bser.Utils.*;
import java.io.IOException;
import im.actor.model.network.parser.*;
import java.util.List;
import java.util.ArrayList;
import im.actor.model.api.*;

public class RequestUploadPart extends Request<ResponseVoid> {

    public static final int HEADER = 0x14;
    public static RequestUploadPart fromBytes(byte[] data) throws IOException {
        return Bser.parse(new RequestUploadPart(), data);
    }

    private UploadConfig config;
    private int blockIndex;
    private byte[] payload;

    public RequestUploadPart(UploadConfig config, int blockIndex, byte[] payload) {
        this.config = config;
        this.blockIndex = blockIndex;
        this.payload = payload;
    }

    public RequestUploadPart() {

    }

    public UploadConfig getConfig() {
        return this.config;
    }

    public int getBlockIndex() {
        return this.blockIndex;
    }

    public byte[] getPayload() {
        return this.payload;
    }

    @Override
    public void parse(BserValues values) throws IOException {
        this.config = values.getObj(1, new UploadConfig());
        this.blockIndex = values.getInt(2);
        this.payload = values.getBytes(3);
    }

    @Override
    public void serialize(BserWriter writer) throws IOException {
        if (this.config == null) {
            throw new IOException();
        }
        writer.writeObject(1, this.config);
        writer.writeInt(2, this.blockIndex);
        if (this.payload == null) {
            throw new IOException();
        }
        writer.writeBytes(3, this.payload);
    }

    @Override
    public String toString() {
        String res = "rpc UploadPart{";
        res += "blockIndex=" + this.blockIndex;
        res += ", payload=" + byteArrayToStringCompact(this.payload);
        res += "}";
        return res;
    }

    @Override
    public int getHeaderKey() {
        return HEADER;
    }
}
