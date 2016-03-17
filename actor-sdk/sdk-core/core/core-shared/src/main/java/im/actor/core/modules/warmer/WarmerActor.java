package im.actor.core.modules.warmer;

import im.actor.core.modules.ModuleContext;
import im.actor.core.modules.contacts.BookImportActor;
import im.actor.core.modules.contacts.ContactsSyncActor;
import im.actor.core.modules.sequence.SequenceActor;
import im.actor.core.util.ModuleActor;

public class WarmerActor extends ModuleActor {

    private boolean isSequenceStarted;
    private boolean isDialogsLoaded;
    private boolean isGroupedDialogsLoaded;
    private boolean isContactsLoaded;

    public WarmerActor(ModuleContext context) {
        super(context);
    }

    @Override
    public void preStart() {
        isDialogsLoaded = false;
    }

    public void onSequenceStarted() {
        if (!isSequenceStarted) {
            isSequenceStarted = true;

            if (isDialogsLoaded && isGroupedDialogsLoaded) {
                onAllDialogsLoaded();
            }
        }
    }

    public void onDialogsLoaded() {
        if (!isDialogsLoaded) {
            isDialogsLoaded = true;

            if (isGroupedDialogsLoaded && isSequenceStarted) {
                onAllDialogsLoaded();
            }
        }
    }

    public void onGroupedDialogsLoaded() {
        if (!isGroupedDialogsLoaded) {
            isGroupedDialogsLoaded = true;

            if (isDialogsLoaded && isSequenceStarted) {
                onAllDialogsLoaded();
            }
        }
    }

    private void onAllDialogsLoaded() {
        context().getContactsModule().getContactSyncActor().send(new ContactsSyncActor.StartSync());
    }

    public void onContactsLoaded() {
        if (!isContactsLoaded) {
            isContactsLoaded = true;
            context().getContactsModule().getBookImportActor().send(new BookImportActor.StartSync());
            context().getEncryption().getKeyManagerInt().start();
            context().getUpdatesModule().getUpdateActor().send(new SequenceActor.StartSequence());
        }
    }

    @Override
    public void onReceive(Object message) {
        if (message instanceof OnContactsLoaded) {
            onContactsLoaded();
        } else if (message instanceof OnDialogsLoaded) {
            onDialogsLoaded();
        } else if (message instanceof OnGroupedDialogsLoaded) {
            onGroupedDialogsLoaded();
        } else if (message instanceof OnSequenceStarted) {
            onSequenceStarted();
        } else {
            super.onReceive(message);
        }
    }

    public static class OnSequenceStarted {

    }

    public static class OnContactsLoaded {

    }

    public static class OnDialogsLoaded {

    }

    public static class OnGroupedDialogsLoaded {

    }
}
