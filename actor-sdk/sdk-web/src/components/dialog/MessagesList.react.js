/*
 * Copyright (C) 2015-2016 Actor LLC. <https://actor.im>
 */

import { forEach } from 'lodash';
import React, { Component, PropTypes } from 'react';
import Loading from './messages/Loading.react';
import Welcome from './messages/Welcome.react';

import DropdownStore from '../../stores/DropdownStore';

class MessagesList extends Component {
  static propTypes = {
    messages: PropTypes.array.isRequired,
    selectedMessages: PropTypes.object.isRequired,
    peer: PropTypes.object.isRequired,
    overlay: PropTypes.array.isRequired,
    dropdownMessage: PropTypes.object,
    isMember: PropTypes.bool.isRequired,
    isAllMessagesLoaded: PropTypes.bool.isRequired,
    onSelect: PropTypes.func.isRequired,
    onVisibilityChange: PropTypes.func.isRequired,
    isExperimental: PropTypes.bool.isRequired,
    components: PropTypes.shape({
      MessageItem: PropTypes.func.isRequired
    }).isRequired
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
    const {messages, peer, overlay, selectedMessages, dropdownMessage, components} = this.props;
    const {MessageItem} = this.props.components;

    const result = [];
    forEach(messages, (message, index) => {
      const overlayItem = overlay[index];
      if (overlayItem && overlayItem.dateDivider) {
        result.push(
          <li className="date-divider" key={`o${index}`}>
            {overlayItem.dateDivider}
          </li>
        );
      }

      result.push(
        <MessageItem
          peer={peer}
          message={message}
          isSelected={selectedMessages.has(message.rid)}
          isHighlighted={dropdownMessage && message && dropdownMessage.rid === message.rid}
          isShortMessage={overlayItem.useShort}

          onSelect={this.props.onSelect}
          onVisibilityChange={this.props.onVisibilityChange}
          components={this.props.components}
          isExperimental={this.props.isExperimental}
          key={message.sortKey}
        />
      );
    });

    return result;
  }

  render() {
    return (
      <ul className="messages__list">
        {this.renderWelcome()}
        {this.renderLoading()}
        {this.renderMessages()}
      </ul>
    )
  }
}

export default MessagesList;
