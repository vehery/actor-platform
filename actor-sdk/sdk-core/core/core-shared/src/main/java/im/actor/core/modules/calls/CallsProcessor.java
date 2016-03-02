package im.actor.core.modules.calls;

import im.actor.core.api.updates.UpdateCallHandled;
import im.actor.core.api.updates.UpdateIncomingCall;
import im.actor.core.modules.ModuleContext;
import im.actor.core.modules.sequence.Processor;

public class CallsProcessor implements Processor {
    private ModuleContext context;

    public CallsProcessor(ModuleContext context) {
        this.context = context;
    }

    @Override
    public boolean process(Object update) {
        if (update instanceof UpdateIncomingCall) {
            UpdateIncomingCall updateIncomingCall = (UpdateIncomingCall) update;
            if (context.getConfiguration().isVoiceCallsEnabled()) {
                int index = updateIncomingCall.getAttemptIndex() != null ? updateIncomingCall.getAttemptIndex() : 0;
                context.getCallsModule().getCallManager().send(
                        new CallManagerActor.OnIncomingCall(
                                updateIncomingCall.getCallId(),
                                index));
            }
            return true;
        } else if (update instanceof UpdateCallHandled) {
            UpdateCallHandled updateCallHandled = (UpdateCallHandled) update;
            if (context.getConfiguration().isVoiceCallsEnabled()) {
                int index = updateCallHandled.getAttemptIndex() != null ? updateCallHandled.getAttemptIndex() : 0;
                context.getCallsModule().getCallManager().send(
                        new CallManagerActor.OnIncomingCallHandled(
                                updateCallHandled.getCallId(),
                                index));
            }
            return true;
        }
        return false;
    }
}