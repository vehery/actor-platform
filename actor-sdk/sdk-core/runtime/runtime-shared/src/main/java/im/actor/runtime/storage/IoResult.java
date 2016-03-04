package im.actor.runtime.storage;

import im.actor.runtime.promise.Promise;
import im.actor.runtime.promise.Promises;

public abstract class IoResult {

    public static Promise<IoResult> OK() {
        return Promises.success(null);
    }
}
