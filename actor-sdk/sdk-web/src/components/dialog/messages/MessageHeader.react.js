/*
 * Copyright (C) 2015-2016 Actor LLC. <https://actor.im>
 */

import React, { Component, PropTypes } from 'react';
import State from './State.react';

import { escapeWithEmoji } from '../../../utils/EmojiUtils';

class MessageHeader extends Component {
  static propTypes = {
    message: PropTypes.object.isRequired,
    onClick: PropTypes.func.isRequired
  };

  renderTitle(message) {
    if (!message.sender.title) {
      return null;
    }

    const title = escapeWithEmoji(message.sender.title);
    return (
      <span
        className="message__sender__name"
        dangerouslySetInnerHTML={{__html: title}}
      />
    );
  }

  renderUsername(message) {
    if (!message.sender.userName) {
      return null;
    }

    return (
      <span className="message__sender__nick">
        {'@' + message.sender.userName}
      </span>
    );
  }

  render() {
    const { message, onClick } = this.props;

    return (
      <header className="message__header">
        <h3 className="message__sender">
          <a onClick={onClick}>
            {this.renderTitle(message)}
            {this.renderUsername(message)}
          </a>
        </h3>
        <time className="message__timestamp">
          {message.date}
        </time>
        <State message={message} />
      </header>
    )
  }
}

export default MessageHeader;
