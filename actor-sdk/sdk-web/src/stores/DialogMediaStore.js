/*
 * Copyright (C) 2016 Actor LLC. <https://actor.im>
 */

import { ReduceStore } from 'flux/utils';
import Dispatcher from '../dispatcher/ActorAppDispatcher';
import { ActionTypes } from '../constants/ActorAppConstants';

class DialogMediaStore extends ReduceStore {
  getInitialState() {
    return {
      isOpen: false,
      isLoading: true,
      results: []
    };
  }

  reduce(state, action) {
    switch (action.type) {
      case ActionTypes.BIND_DIALOG_PEER:
      case ActionTypes.SEARCH_MESSAGES_SHOW:
      case ActionTypes.DIALOG_MEDIA_HIDE:
        return this.getInitialState();

      case ActionTypes.DIALOG_MEDIA_SHOW:
        return {
          ...state,
          isOpen: true
        }

      case ActionTypes.DIALOG_MEDIA_SEARCH_PHOTO_SUCCESS:
        console.debug('loaded')
        return {
          ...state,
          isLoading: false,
          results: action.response
        }

      default:
        return state;
    }
  }
}

export default new DialogMediaStore(Dispatcher);
