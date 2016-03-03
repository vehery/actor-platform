/*
 * Copyright (C) 2015 Actor LLC. <https://actor.im>
 */

package im.actor.core.entity;

import org.jetbrains.annotations.Nullable;

import im.actor.core.api.ApiPeerType;

public enum PeerType {
    PRIVATE, GROUP, PRIVATE_ENCRYPTED;

    @Nullable
    public static PeerType fromApiPeerType(ApiPeerType peerType) {
        switch (peerType) {
            case GROUP:
                return GROUP;
            case PRIVATE:
                return PRIVATE;
            case ENCRYPTEDPRIVATE:
                return PRIVATE_ENCRYPTED;
            default:
                return null;
        }
    }
}
