/*
 * Copyright (C) 2016 Actor LLC. <https://actor.im>
 */

import React, { Component, PropTypes } from 'react';
import { shouldComponentUpdate } from 'react-addons-pure-render-mixin';
import classnames from 'classnames';

import AvatarItem from './AvatarItem.react';

import { escapeWithEmoji } from '../../utils/EmojiUtils';

class ContactItem extends Component {
  static propTypes = {
    uid: PropTypes.number.isRequired,
    name: PropTypes.string.isRequired,
    placeholder: PropTypes.string.isRequired,
    avatar: PropTypes.string,
    avatarSize: PropTypes.string,

    className: PropTypes.string,

    children: PropTypes.node
  };

  constructor(props) {
    super(props);

    this.shouldComponentUpdate = shouldComponentUpdate.bind(this);
  }

  render() {
    const { name, placeholder, avatar, children, className, avatarSize } = this.props;
    const contactClassName = classnames('contact row middle-xs', className);

    return (
      <div className={contactClassName}>
        <div className="contact__avatar">
          <AvatarItem
            image={avatar}
            placeholder={placeholder}
            size={avatarSize || 'small'}
            title={name}
          />
        </div>

        <div className="contact__body col-xs">
          <span className="title" dangerouslySetInnerHTML={{ __html: escapeWithEmoji(name) }}/>
        </div>

        <div className="contact__controls">
          {children}
        </div>
      </div>
    );
  }
}

export default ContactItem;
