/*
 * Copyright (C) 2015-2016 Actor LLC. <https://actor.im>
 */

import React, { Component, PropTypes } from 'react';
import classnames from 'classnames';
import PeerUtils from '../../../utils/PeerUtils';
import { MessageContentTypes } from '../../../constants/ActorAppConstants';

import DialogActionCreators from '../../../actions/DialogActionCreators';
import ActivityActionCreators from '../../../actions/ActivityActionCreators';
import DropdownActionCreators from '../../../actions/DropdownActionCreators';

import AvatarItem from '../../common/AvatarItem.react';
import State from './State.react';
import Reactions from './Reactions.react';

import MessageHeader from './MessageHeader.react';

class MessageItem extends Component {
  static propTypes = {
    peer: PropTypes.object.isRequired,
    message: PropTypes.object.isRequired,
    isSelected: PropTypes.bool.isRequired,
    isShortMessage: PropTypes.bool.isRequired,
    isHighlighted: PropTypes.bool.isRequired,
    isExperimental: PropTypes.bool.isRequired,
    onSelect: PropTypes.func.isRequired,
    components: PropTypes.object.isRequired
  };

  constructor(props) {
    super(props);

    this.onSelect = this.onSelect.bind(this);
    this.onAvatarClick = this.onAvatarClick.bind(this);
    this.onShowActions = this.onShowActions.bind(this);
  }

  shouldComponentUpdate(nextProps) {
    return (this.props.message !== nextProps.message || this.props.isShortMessage !== nextProps.isShortMessage);
  }

  onAvatarClick() {
    const { message, peer } = this.props;

    if (PeerUtils.equals(peer, message.sender.peer)) {
      ActivityActionCreators.show();
    } else {
      DialogActionCreators.selectDialogPeerUser(message.sender.peer.id);
    }
  }

  onShowActions() {
    const { message } = this.props;
    DropdownActionCreators.openMessageActions(event.target.getBoundingClientRect(), message);
  }

  onSelect() {
    this.props.onSelect(this.props.message.rid);
  }

  renderLeftBlock() {
    const { message, isShortMessage } = this.props;

    if (isShortMessage) {
      return (
        <div className="message__info text-right">
          <time className="message__timestamp">{message.date}</time>
          <State message={message} />
        </div>
      );
    }

    return (
      <div className="message__info message__info--avatar">
        <AvatarItem
          image={message.sender.avatar}
          placeholder={message.sender.placeholder}
          title={message.sender.title}
          onClick={this.onAvatarClick}
        />
      </div>
    );
  }

  renderHeader() {
    const { message, isShortMessage } = this.props;
    if (isShortMessage) {
      return null;
    }

    return (
      <MessageHeader message={this.props.message} onClick={this.onAvatarClick} />
    )
  }

  renderContent() {
    const { message, components } = this.props;
    const {
      Service,
      Text,
      Modern,
      Photo,
      Document,
      Voice,
      Contact,
      Location,
      Sticker
    } = components;

    switch (message.content.content) {
      case MessageContentTypes.SERVICE:
        return <Service {...message.content} className="message__content message__content--service"/>;
      case MessageContentTypes.TEXT:
        return <Text {...message.content} className="message__content message__content--text"/>;
      case MessageContentTypes.PHOTO:
        return (
          <Photo
            content={message.content}
            className="message__content message__content--photo"
            loadedClassName="message__content--photo--loaded"
          />
        );
      case MessageContentTypes.DOCUMENT:
        return <Document content={message.content} className="message__content message__content--document"/>;
      case MessageContentTypes.VOICE:
        return <Voice content={message.content} className="message__content message__content--voice"/>;
      case MessageContentTypes.CONTACT:
        return <Contact {...message.content} className="message__content message__content--contact"/>;
      case MessageContentTypes.LOCATION:
        return <Location content={message.content} className="message__content message__content--location"/>;
      case MessageContentTypes.TEXT_MODERN:
        return <Modern {...message.content} className="message__content message__content--modern"/>;
      case MessageContentTypes.STICKER:
        return <Sticker {...message.content} className="message__content message__content--sticker"/>;
      default:
        console.error('Unexpected message content type: %s', message.content.content);
        return null;
    }
  }

  renderMessageSelection() {
    if (!this.props.isExperimental) {
      return null;
    }

    return (
      <div className="message__actions__selector" onClick={this.onSelect}>
        <i className="icon material-icons">check</i>
      </div>
    );
  }

  render() {
    const { message, peer, isSelected, isHighlighted, isShortMessage, isExperimental, components } = this.props;

    const messageClassName = classnames('message row', {
      'message--same-sender': isShortMessage,
      'message--active': isHighlighted,
      'message--selected': isSelected
    });

    const messageActionsMenuClassName = classnames('message__actions__menu', {
      'message__actions__menu--opened': isHighlighted
    });

    return (
      <li className={messageClassName}>
        {this.renderLeftBlock()}
        <div className="message__body col-xs">
          {this.renderHeader()}
          {this.renderContent()}
        </div>
        <div className="message__actions">
          <Reactions peer={peer} message={message}/>
          <div className={messageActionsMenuClassName} onClick={this.onShowActions}>
            <svg
              className="icon icon--dropdown"
              dangerouslySetInnerHTML={{__html: '<use xlink:href="assets/images/icons.svg#cog"/>'}}
            />
          </div>
          {this.renderMessageSelection()}
        </div>
      </li>
    );
  }
}

export default MessageItem;
