/*
 * Copyright (C) 2015 Actor LLC. <https://actor.im>
 */

import { dispatch, dispatchAsync } from '../dispatcher/ActorAppDispatcher';
import { ActionTypes } from '../constants/ActorAppConstants';
import DialogStore from '../stores/DialogStore';
import ActorClient from '../utils/ActorClient';

class DialogMediaActionCreators {
  show() {
    dispatch(ActionTypes.DIALOG_MEDIA_SHOW);
  }

  hide() {
    dispatch(ActionTypes.DIALOG_MEDIA_HIDE);
  }

  findAllPhotos() {
    const peer = DialogStore.getCurrentPeer();
    dispatchAsync(ActorClient.findAllPhotos(peer), {
      request: ActionTypes.DIALOG_MEDIA_SEARCH_PHOTO,
      success: ActionTypes.DIALOG_MEDIA_SEARCH_PHOTO_SUCCESS,
      failure: ActionTypes.DIALOG_MEDIA_SEARCH_PHOTO_ERROR
    }, { peer });
  }
}

export default new DialogMediaActionCreators();
