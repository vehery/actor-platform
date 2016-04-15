package im.actor.core.viewmodel;

import im.actor.runtime.Runtime;
import im.actor.runtime.function.Consumer;
import im.actor.runtime.promise.Promise;
import im.actor.runtime.promise.PromiseDispatcher;

public class CommandPromise<T> implements Command<T> {

    private Promise<T> promise;

    public CommandPromise(Promise<T> promise) {
        this.promise = promise;
    }

    @Override
    public void start(final CommandCallback<T> callback) {
        promise.then(new Consumer<T>() {
            @Override
            public void apply(T t) {
                callback.onResult(t);
            }
        }).failure(new Consumer<Exception>() {
            @Override
            public void apply(Exception e) {
                callback.onError(e);
            }
        }).done(new PromiseDispatcher() {
            @Override
            public void dispatch(Promise promise, Runnable runnable) {
                Runtime.postToMainThread(runnable);
            }
        });
    }
}
