/*
 * Copyright (C) 2015-2016 Actor LLC. <https://actor.im>
 */

import { map, isFunction } from 'lodash';

import React, { Component, PropTypes } from 'react';
import { Container } from 'flux/utils';
import PeerUtils from '../utils/PeerUtils';

import ConnectionState from './common/ConnectionState.react';

import ActivityStore from '../stores/ActivityStore';
import DialogStore from '../stores/DialogStore';
import MessageStore from '../stores/MessageStore';

import DialogActionCreators from '../actions/DialogActionCreators';

class DialogSection extends Component {
  static propTypes = {
    delegate: PropTypes.object.isRequired,
    params: PropTypes.shape({
      id: PropTypes.string.isRequired
    }).isRequired
  };

  static getStores() {
    return [ActivityStore, MessageStore, DialogStore]
  }

  static calculateState() {
    return {
      peer: DialogStore.getCurrentPeer(),
      isMember: DialogStore.isMember(),
      messages: MessageStore.getMessages(),
      overlay: MessageStore.getOverlay(),
      messagesCount: MessageStore.getRenderMessagesCount(),
      isActivityOpen: ActivityStore.isOpen()
    };
  }

  constructor(props) {
    super(props);

    this.components = props.delegate.components.dialog;

    const peer = PeerUtils.stringToPeer(props.params.id);
    DialogActionCreators.selectDialogPeer(peer);

    this.onLoadMoreMessages = this.onLoadMoreMessages.bind(this);
  }

  componentWillReceiveProps(nextProps) {
    const { params } = nextProps;
    if (this.props.params.id === params.id) {
      return;
    }

    const peer = PeerUtils.stringToPeer(params.id);
    DialogActionCreators.selectDialogPeer(peer);
  }

  componentWillUnmount() {
    // Unbind from current peer
    DialogActionCreators.selectDialogPeer(null);
  }

  onLoadMoreMessages() {
    const { peer } = this.state;
    if (peer) {
      DialogActionCreators.loadMoreMessages(peer);
    }
  }

  renderActivity() {
    return this.components.activity.map((Activity, index) => (
      <Activity key={index} />
    ))
  }

  render() {
    const { peer, isMember, messages, overlay, messagesCount } = this.state;

    const { Toolbar, MessagesSection, DialogFooter } = this.components;

    return (
      <section className="main">
        <Toolbar />
        <div className="flexrow">
          <section className="dialog">
            <ConnectionState />
            <MessagesSection
              peer={peer}
              messages={messages}
              overlay={overlay}
              count={messagesCount}
              isMember={isMember}
              onLoadMore={this.onLoadMoreMessages}
            />
            <DialogFooter isMember={isMember} />
          </section>
          {this.renderActivity()}
        </div>
      </section>
    );
  }
}

export default Container.create(DialogSection);
