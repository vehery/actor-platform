/*
 * Copyright (C) 2015-2016 Actor LLC. <https://actor.im>
 */

import { isFunction } from 'lodash';

import React, { Component, PropTypes } from 'react';
import {shouldComponentUpdate} from 'react-addons-pure-render-mixin';
import Loading from './messages/Loading.react';
import Welcome from './messages/Welcome.react';
import MessagesScroller from './MessagesScroller.react';
import MessageGroup from './MessageGroup.react';

class MessagesList extends Component {
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

  shouldComponentUpdate(nextProps) {
    return this.props.peer !== nextProps.peer ||
           this.props.count !== nextProps.count ||
           this.props.messages !== nextProps.messages ||
           this.props.overlay !== nextProps.overlay ||
           this.props.selectedMessages !== nextProps.selectedMessages ||
           this.props.isAllMessagesLoaded !== nextProps.isAllMessagesLoaded ||
           this.props.isMember !== nextProps.isMember;
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
    const { peer, messages, overlay, count, selectedMessages } = this.props;

    const result = [];

    let group = [];
    for (let index = messages.length - count; index < messages.length; index++) {
      const overlayItem = overlay[index];

      if (overlayItem.dateDivider) {
        result.push(
          <div className="date-divider" key={overlayItem.dateDivider}>
            {overlayItem.dateDivider}
          </div>
        );
      }

      group.push(messages[index]);

      const nextOverlay = overlay[index + 1];
      if ((!nextOverlay || !nextOverlay.useShort) && group.length) {
        result.push(
          <MessageGroup
            peer={peer}
            messages={group}
            onSelect={this.props.onSelect}
            onVisibilityChange={this.props.onVisibilityChange}
            key={group[group.length - 1].sortKey}
          />
        );

        group = [];
      }
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
