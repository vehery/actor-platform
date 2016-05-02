package im.actor.core.modules.file;

import java.util.ArrayList;

import im.actor.core.api.rpc.RequestGetFileUrlBuilder;
import im.actor.core.modules.ModuleContext;
import im.actor.core.modules.ModuleActor;
import im.actor.runtime.Crypto;
import im.actor.runtime.actors.ask.AskMessage;
import im.actor.runtime.bser.DataOutput;
import im.actor.runtime.crypto.primitives.digest.SHA256;
import im.actor.runtime.crypto.primitives.hmac.HMAC;
import im.actor.runtime.promise.Promise;

public class FileUrlLoader extends ModuleActor {

    private boolean isLoaded = false;

    private String baseUrl;
    private String seed;
    private byte[] signatureSecret;

    public FileUrlLoader(ModuleContext context) {
        super(context);
    }

    @Override
    public void preStart() {
        super.preStart();

        ArrayList<String> algos = new ArrayList<>();
        algos.add("HMAC_SHA256");
        api(new RequestGetFileUrlBuilder(algos)).then(r -> {
            baseUrl = r.getBaseUrl();
            seed = r.getSeed();
            signatureSecret = r.getSignatureSecret();
            isLoaded = true;
            unstashAll();
        });
    }

    public Promise<String> askUrl(final long fileId, final long accessHash) {

        long testFileId = -8546473890980850083L;
        long testAccessHash = -5006470655828232781L;
        byte[] testSecret = new byte[]{21, 85, 18, -3, -24, 6, 50, -49, 57, -20, -74, -121, -23, 1, -28, -3, 123, -4, 95, -27, 125, 74, -41, 92, -59, -5, 72, 76, 60, -104, -52, 123};
        String testSeed = "080010acb183b9051a2839313330393138373136353165393738636562343336383461373636323039333936343964343333";

        // byte[] seedBytes = Crypto.fromHex(seed);
        byte[] seedBytes = Crypto.fromHex(testSeed);

        DataOutput dataToSign = new DataOutput();
        dataToSign.writeBytes(seedBytes);
        dataToSign.writeLongReverse(testFileId);
        dataToSign.writeLongReverse(testAccessHash);
        byte[] bytesToSign = dataToSign.toByteArray();

        HMAC hmac = new HMAC(testSecret, new SHA256(), 64);
        hmac.update(bytesToSign, 0, bytesToSign.length);
        byte[] signedBytes = new byte[hmac.getDigestSize()];
        hmac.doFinal(signedBytes, 0);

        String signature = testSeed + "_" + Crypto.hex(signedBytes);

        return Promise.success(baseUrl + "/" + fileId + "?signature=" + signature);
    }


    //
    // Messages
    //

    @Override
    public Promise onAsk(Object message) throws Exception {
        if (message instanceof AskUrl) {
            if (!isLoaded) {
                stash();
                return null;
            }
            AskUrl askUrl = (AskUrl) message;
            return askUrl(askUrl.getFileId(), askUrl.getAccessHash());
        } else {
            return super.onAsk(message);
        }
    }

    public static class AskUrl implements AskMessage<String> {

        private long fileId;
        private long accessHash;

        public AskUrl(long fileId, long accessHash) {
            this.fileId = fileId;
            this.accessHash = accessHash;
        }

        public long getFileId() {
            return fileId;
        }

        public long getAccessHash() {
            return accessHash;
        }
    }
}