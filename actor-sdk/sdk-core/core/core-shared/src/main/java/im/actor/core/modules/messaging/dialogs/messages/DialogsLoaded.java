package im.actor.core.modules.messaging.dialogs.messages;

import java.util.List;

import im.actor.core.modules.messaging.entity.DialogHistory;

public class DialogsLoaded {

    private List<DialogHistory> history;

    public DialogsLoaded(List<DialogHistory> history) {
        this.history = history;
    }

    public List<DialogHistory> getHistory() {
        return history;
    }
}
