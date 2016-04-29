/*
 * Copyright (C) 2015 Actor LLC. <https://actor.im>
 */

import { ReduceStore } from 'flux/utils';
import Dispatcher from '../dispatcher/ActorAppDispatcher';
// import { ActionTypes } from '../constants/ActorAppConstants';

class WriteStore extends ReduceStore {
  getInitialState() {
    return {};
  }

  reduce(state, action) {
    switch(action.type) {
      default:
        return state;
    }
  }
}

export default new WriteStore(Dispatcher);
