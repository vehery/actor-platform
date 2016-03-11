/*
 * Copyright (C) 2015-2016 Actor LLC. <https://actor.im>
 */

import { forEach, map, debounce, isFunction } from 'lodash';

import React, { Component, PropTypes } from 'react';
import { Container } from 'flux/utils';
import Scrollbar from '../common/Scrollbar.react';

import MessageActionCreators from '../../actions/MessageActionCreators';

import VisibilityStore from '../../stores/VisibilityStore';
import DialogStore from '../../stores/DialogStore';
import MessageStore from '../../stores/MessageStore';
import DropdownStore from '../../stores/DropdownStore';

import DefaultMessageItem from './messages/MessageItem.react';
import MessagesList from './MessagesList.react';

// Default message content components
import DefaultService from './messages/Service.react';
import DefaultText from './messages/Text.react';
import DefaultPhoto from './messages/Photo.react.js';
import DefaultDocument from './messages/Document.react';
import DefaultVoice from './messages/Voice.react';
import DefaultContact from './messages/Contact.react';
import DefaultLocation from './messages/Location.react.js';
import DefaultModern from './messages/Modern.react.js';
import DefaultSticker from './messages/Sticker.react.js';


let _delayed = [];
let flushDelayed = () => {
  forEach(_delayed, (p) => MessageActionCreators.setMessageShown(p.peer, p.message));
  _delayed = [];
};

let flushDelayedDebounced = debounce(flushDelayed, 30, {maxWait: 100});

class MessagesSection extends Component {
  static propTypes = {
    messages: PropTypes.array.isRequired,
    overlay: PropTypes.array.isRequired,
    peer: PropTypes.object.isRequired,
    isMember: PropTypes.bool.isRequired,
    onScroll: PropTypes.func.isRequired
  };

  static contextTypes = {
    delegate: PropTypes.object.isRequired,
    isExperimental: PropTypes.bool.isRequired
  };

  static getStores() {
    return [MessageStore, VisibilityStore, DropdownStore];
  }

  static calculateState() {
    return {
      selectedMessages: MessageStore.getSelected(),
      isAllMessagesLoaded: MessageStore.isLoaded(),
      isAppVisible: VisibilityStore.isAppVisible(),
      dropdownMessage: DropdownStore.getMessage()
    };
  }

  componentDidUpdate() {
    const { isAppVisible } = this.state;
    if (isAppVisible) {
      flushDelayed();
    }
  };

  onMessageSelect = (rid) => {
    const { selectedMessages } = this.state;
    if (selectedMessages.has(rid)) {
      MessageActionCreators.setSelected(selectedMessages.remove(rid));
    } else {
      MessageActionCreators.setSelected(selectedMessages.add(rid));
    }
  };

  onMessageVisibilityChange = (message, isVisible) => {
    const { peer } = this.props;

    if (isVisible) {
      _delayed.push({peer, message});
      if (VisibilityStore.isAppVisible()) {
        flushDelayedDebounced();
      }
    }
  };

  getComponents() {
    const {dialog} = this.context.delegate.components;

    if (dialog && dialog.messages && isFunction(dialog.messages.message)) {
      return {
        MessageItem: dialog.messages.message,
        Service: dialog.messages.service || DefaultService,
        Text: dialog.messages.text || DefaultText,
        Modern: dialog.messages.modern || DefaultModern,
        Photo: dialog.messages.photo || DefaultPhoto,
        Document: dialog.messages.document || DefaultDocument,
        Voice: dialog.messages.voice || DefaultVoice,
        Contact: dialog.messages.contact || DefaultContact,
        Location: dialog.messages.location || DefaultLocation,
        Sticker: dialog.messages.sticker || DefaultSticker
      };
    }

    return {
      MessageItem: DefaultMessageItem,
      Service: DefaultService,
      Text: DefaultText,
      Modern: DefaultModern,
      Photo: DefaultPhoto,
      Document: DefaultDocument,
      Voice: DefaultVoice,
      Contact: DefaultContact,
      Location: DefaultLocation,
      Sticker: DefaultSticker
    };
  }

  render() {
    const { peer, overlay, messages, isMember } = this.props;
    const { selectedMessages, isAllMessagesLoaded, dropdownMessage } = this.state;
    const { isExperimental } = this.context;

    const components = this.getComponents();

    return (
      <Scrollbar onScroll={this.props.onScroll} ref="messagesScroll">
        <MessagesList
          peer={peer}
          overlay={overlay}
          messages={messages}
          selectedMessages={selectedMessages}
          dropdownMessage={dropdownMessage}
          isMember={isMember}
          isAllMessagesLoaded={isAllMessagesLoaded}
          onSelect={this.onMessageSelect}
          onVisibilityChange={this.onMessageVisibilityChange}
          components={components}
          isExperimental={isExperimental}
        />
      </Scrollbar>
    );
  }
}

export default Container.create(MessagesSection, {pure: false, withProps: true});
