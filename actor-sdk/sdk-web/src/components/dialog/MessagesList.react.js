/*
 * Copyright (C) 2015-2016 Actor LLC. <https://actor.im>
 */

import React, { Component, PropTypes } from 'react';
import {shouldComponentUpdate} from 'react-addons-pure-render-mixin';
import Loading from './messages/Loading.react';
import Welcome from './messages/Welcome.react';
import MessagesScroller from './MessagesScroller.react';

class MessagesList extends Component {
  static contextTypes = {
    delegate: PropTypes.object.isRequired
  };

  static propTypes = {
    peer: PropTypes.object.isRequired,
    messages: PropTypes.array.isRequired,
    overlay: PropTypes.array.isRequired,
    count: PropTypes.number.isRequired,
    selectedMessages: PropTypes.object.isRequired,
    isMember: PropTypes.bool.isRequired,
    isAllMessagesLoaded: PropTypes.bool.isRequired,
    onSelect: PropTypes.func.isRequired,
    onVisibilityChange: PropTypes.func.isRequired,
    onLoadMore: PropTypes.func.isRequired
  };

  constructor(props, context) {
    super(props, context);

    this.components = {
      Message: context.delegate.components.dialog.messages.Message
    };

    this.shouldComponentUpdate = shouldComponentUpdate.bind(this);
  }

  renderWelcome() {
    const {peer, isMember, isAllMessagesLoaded} = this.props;

    if (isMember && isAllMessagesLoaded) {
      return <Welcome peer={peer} />;
    }

    return null;
  }

  renderLoading() {
    const {isAllMessagesLoaded, messages} = this.props;

    if (!isAllMessagesLoaded && messages.length >= 30) {
      return <Loading />;
    }

    return null;
  }

  renderMessages() {
    const {peer, messages, overlay, count, selectedMessages} = this.props;
    const {Message} = this.components;

    const result = [];
    for (let index = messages.length - count; index < messages.length; index++) {
      const overlayItem = overlay[index];
      if (overlayItem && overlayItem.dateDivider) {
        result.push(
          <div className="date-divider" key={`o${index}`}>
            {overlayItem.dateDivider}
          </div>
        );
      }

      const message = messages[index];
      result.push(
        <Message
          key={message.sortKey}
          message={message}
          isShort={overlayItem.useShort}
          isSelected={selectedMessages.has(message.rid)}
          onSelect={this.props.onSelect}
          onVisibilityChange={this.props.onVisibilityChange}
          peer={peer}
        />
      );
    }

    return result;
  }

  render() {
    const { peer, onLoadMore } = this.props;

    return (
      <MessagesScroller className="messages" peer={peer} onLoadMore={onLoadMore}>
        <div className="messages__list">
          {this.renderWelcome()}
          {this.renderLoading()}
          {this.renderMessages()}
        </div>
      </MessagesScroller>
    )
  }
}

export default MessagesList;
