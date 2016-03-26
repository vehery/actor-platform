package im.actor.core.modules.warmer;

import im.actor.core.modules.ModuleContext;
import im.actor.core.modules.sequence.SequenceActor;
import im.actor.core.util.ModuleActor;

public class WarmerActor extends ModuleActor {

    public WarmerActor(ModuleContext context) {
        super(context);
    }

    public void onSequenceStarted() {
        // Starting Sequence
        context().getUpdatesModule().getUpdateActor().send(new SequenceActor.LaunchSequence());
    }

    @Override
    public void onReceive(Object message) {
        if (message instanceof OnSequenceStarted) {
            onSequenceStarted();
        } else {
            super.onReceive(message);
        }
    }

    public static class OnSequenceStarted {

    }
}
