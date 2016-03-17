package im.actor.core.viewmodel;

import java.util.ArrayList;

import im.actor.runtime.mvvm.ValueModel;

public class DialogGroupsVM {
    
    private ValueModel<ArrayList<DialogGroupVM>> groupsValueModel;

    public DialogGroupsVM() {
        groupsValueModel = new ValueModel<ArrayList<DialogGroupVM>>("groups.model", null);
    }

    public ValueModel<ArrayList<DialogGroupVM>> getGroupsValueModel() {
        return groupsValueModel;
    }
}
