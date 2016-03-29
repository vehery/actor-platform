/*
 * Copyright (C) 2015-2016 Actor LLC. <https://actor.im>
 */

import React, { Component, PropTypes } from 'react';

import DefaultMessageItem from './messages/MessageItem.react';

class MessageGroup extends Component {
  static contextTypes = {
    delegate: PropTypes.object.isRequired
  };

  static propTypes = {
    messages: PropTypes.array.isRequired
  };

  constructor(props, context) {
    super(props);

    const {dialog} = context.delegate.components;
    if (dialog && dialog.messages && isFunction(dialog.messages.message)) {
      this.components = {
        MessageItem: dialog.messages.message
      };
    } else {
      this.components = {
        MessageItem: DefaultMessageItem
      };
    }
  }

  shouldComponentUpdate(nextProps) {
    return this.props.messages.length !== nextProps.messages.length;
  }

  render() {
    const { MessageItem } = this.components;
    const { peer, messages } = this.props;

    const result = [];
    for (let i = 0; i < messages.length; i++) {
      const message = messages[i];

      result.push(
        <MessageItem
          key={message.sortKey}
          peer={peer}
          message={message}
          isShort={i !== 0}
          isSelected={false}
          onSelect={this.props.onSelect}
          onVisibilityChange={this.props.onVisibilityChange}
        />
      )
    }

    return (
      <div className="message-group">
        {result}
      </div>
    )
  }
}

export default MessageGroup;
