/*
 * Copyright (C) 2015-2016 Actor LLC. <https://actor.im>
 */

import React, { Component, PropTypes } from 'react';
import { FormattedMessage } from 'react-intl';
import { escapeWithEmoji } from '../../utils/EmojiUtils'
import UserStore from '../../stores/UserStore';
import AvatarItem from '../common/AvatarItem.react';

class GroupMeta extends Component {
  static propTypes = {
    group: PropTypes.object.isRequired,
    onAvatarClick: PropTypes.func
  };

  renderAbout() {
    const { group: { about } } = this.props;
    if (!about) {
      return null;
    }

    const html = escapeWithEmoji(about).replace(/\n/g, '<br/>');

    return (
      <div
        className="group_profile__meta__description"
        dangerouslySetInnerHTML={{ __html: html }}
      />
    );
  }

  render() {
    const { group, onAvatarClick } = this.props;
    const admin = UserStore.getUser(group.adminId);

    return (
      <div>
        <header>
          <AvatarItem
            size="large"
            image={group.bigAvatar}
            placeholder={group.placeholder}
            title={group.name}
            onClick={onAvatarClick}
          />
          <h3 className="group_profile__meta__title" dangerouslySetInnerHTML={{ __html: escapeWithEmoji(group.name) }}/>
          <div className="group_profile__meta__created">
            <FormattedMessage id="createdBy" />
            &nbsp;
            <span dangerouslySetInnerHTML={{ __html: escapeWithEmoji(admin.name) }}/>
          </div>
        </header>
        {this.renderAbout()}
      </div>
    );
  }
}

export default GroupMeta;
