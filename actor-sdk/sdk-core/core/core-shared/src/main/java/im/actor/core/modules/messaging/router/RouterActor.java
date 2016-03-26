package im.actor.core.modules.messaging.router;

import java.util.List;

import im.actor.core.api.ApiDialogGroup;
import im.actor.core.modules.ModuleContext;
import im.actor.core.modules.messaging.dialogs.GroupedDialogsActor;
import im.actor.core.modules.messaging.router.messages.RouterChatGroupsChanged;
import im.actor.core.util.ModuleActor;

public class RouterActor extends ModuleActor {

    public RouterActor(ModuleContext context) {
        super(context);
    }

    public void onChatGroupsChanged(List<ApiDialogGroup> groups) {
        context().getMessagesModule().getDialogsGroupedActor()
                .send(new GroupedDialogsActor.GroupedDialogsChanged(groups));
    }

    @Override
    public void onReceive(Object message) {
        if (message instanceof RouterChatGroupsChanged) {
            RouterChatGroupsChanged chatGroupsChanged = (RouterChatGroupsChanged) message;
            onChatGroupsChanged(chatGroupsChanged.getGroups());
        } else {
            super.onReceive(message);
        }
    }
}
