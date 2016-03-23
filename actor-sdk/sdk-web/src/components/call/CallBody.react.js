/*
* Copyright (C) 2015-2016 Actor LLC. <https://actor.im>
*/

import React, {Component, PropTypes} from 'react';
import { FormattedMessage } from 'react-intl';
import classNames from 'classnames';

import CallAvatar from './CallAvatar.react';

class CallBody extends Component {
  static propTypes = {
    small: PropTypes.bool,
    peerInfo: PropTypes.object,
    callState: PropTypes.string.isRequired,
    onAvatarClick: PropTypes.func
  };

  render() {
    const { small, peerInfo, callState, onAvatarClick } = this.props;
    if (!peerInfo) {
      return null;
    }

    const titleClassName = classNames('call__title', {
      'call__title--small': small
    });

    return (
      <div className="call__body">
        <CallAvatar
          small={small}
          peerInfo={peerInfo}
          callState={callState}
          onClick={onAvatarClick}
        />
        <h3 className={titleClassName}>
          {peerInfo.name}
        </h3>
      </div>
    );
  }
}

export default CallBody;
