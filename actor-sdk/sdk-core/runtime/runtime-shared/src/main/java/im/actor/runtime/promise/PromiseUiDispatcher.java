package im.actor.runtime.promise;

public class PromiseUiDispatcher extends PromiseDispatcher {

    public final static PromiseUiDispatcher INSTANCE = new PromiseUiDispatcher();

    @Override
    public void dispatch(Promise promise, Runnable runnable) {
        im.actor.runtime.Runtime.postToMainThread(runnable);
    }
}
