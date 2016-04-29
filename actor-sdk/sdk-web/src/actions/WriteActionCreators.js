/*
 * Copyright (C) 2015 Actor LLC. <https://actor.im>
 */

import { dispatch } from '../dispatcher/ActorAppDispatcher';
import { ActionTypes } from '../constants/ActorAppConstants';
import ComposeActionCreators from '../actions/ComposeActionCreators';

export default {
  show() {
    dispatch(ActionTypes.WRITE_MODAL_SHOW);
    ComposeActionCreators.toggleAutoFocus(false);
  },

  hide() {
    dispatch(ActionTypes.WRITE_MODAL_HIDE);
    ComposeActionCreators.toggleAutoFocus(true);
  }
};
