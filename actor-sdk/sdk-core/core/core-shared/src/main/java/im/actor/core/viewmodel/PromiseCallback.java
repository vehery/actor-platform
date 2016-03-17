package im.actor.core.viewmodel;

import im.actor.runtime.function.Consumer;
import im.actor.runtime.promise.Promise;
import im.actor.runtime.promise.PromiseUiDispatcher;

public class PromiseCallback<T> implements Command<T> {

    private Promise<T> promise;

    public PromiseCallback(Promise<T> promise) {
        this.promise = promise;
    }

    @Override
    public void start(final CommandCallback<T> callback) {
        this.promise.then(new Consumer<T>() {
            @Override
            public void apply(T t) {
                callback.onResult(t);
            }
        }).failure(new Consumer<Exception>() {
            @Override
            public void apply(Exception e) {
                callback.onError(e);
            }
        }).done(PromiseUiDispatcher.INSTANCE);
    }
}
