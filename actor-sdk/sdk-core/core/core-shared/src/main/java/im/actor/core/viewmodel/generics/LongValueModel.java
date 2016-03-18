package im.actor.core.viewmodel.generics;

import im.actor.runtime.mvvm.ValueModel;

public class LongValueModel extends ValueModel<Long> {
    /**
     * Create ValueModel
     *
     * @param name         name of variable
     * @param defaultValue default value
     */
    public LongValueModel(String name, Long defaultValue) {
        super(name, defaultValue);
    }

    @Override
    public Long get() {
        return super.get();
    }
}
