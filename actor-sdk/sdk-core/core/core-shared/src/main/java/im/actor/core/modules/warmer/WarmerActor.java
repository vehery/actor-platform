package im.actor.core.modules.warmer;

import im.actor.core.modules.ModuleContext;
import im.actor.core.modules.contacts.BookImportActor;
import im.actor.core.modules.contacts.ContactsSyncActor;
import im.actor.core.util.ModuleActor;
import im.actor.runtime.Log;

public class WarmerActor extends ModuleActor {

    private static final String TAG = "WarmerActor";

    private boolean isDialogsLoaded;
    private boolean isGroupedDialogsLoaded;
    private boolean isContactsLoaded;

    public WarmerActor(ModuleContext context) {
        super(context);
    }

    @Override
    public void preStart() {
        isDialogsLoaded = false;
        isGroupedDialogsLoaded = !config().isEnabledGroupedChatList();

        if (isDialogsLoaded && isGroupedDialogsLoaded) {
            onAllDialogsLoaded();
        }
    }

    public void onDialogsLoaded() {
        if (!isDialogsLoaded) {
            isDialogsLoaded = true;

            if (isGroupedDialogsLoaded) {
                onAllDialogsLoaded();
            }
        }
    }

    public void onGroupedDialogsLoaded() {
        if (!isGroupedDialogsLoaded) {
            isGroupedDialogsLoaded = true;

            if (isDialogsLoaded) {
                onAllDialogsLoaded();
            }
        }
    }

    private void onAllDialogsLoaded() {
        Log.d(TAG, "onAllDialogsLoaded");
        context().getContactsModule().getContactSyncActor().send(new ContactsSyncActor.StartSync());
    }

    public void onContactsLoaded() {
        if (!isContactsLoaded) {
            isContactsLoaded = true;
            context().getContactsModule().getBookImportActor().send(new BookImportActor.StartSync());
            context().getEncryption().getKeyManagerInt().start();
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
        } else {
            super.onReceive(message);
        }
    }

    public static class OnContactsLoaded {

    }

    public static class OnDialogsLoaded {

    }

    public static class OnGroupedDialogsLoaded {

    }
}
