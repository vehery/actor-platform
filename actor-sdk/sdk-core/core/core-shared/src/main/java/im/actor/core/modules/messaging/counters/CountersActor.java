package im.actor.core.modules.messaging.counters;

import im.actor.core.modules.ModuleContext;
import im.actor.core.modules.messaging.dialogs.DialogsInt;
import im.actor.core.util.ModuleActor;

public class CountersActor extends ModuleActor {

    private DialogsInt dialogsInt;

    public CountersActor(DialogsInt dialogsInt, ModuleContext context) {
        super(context);
        this.dialogsInt = dialogsInt;
    }
}