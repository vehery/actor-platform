/*
* Copyright (C) 2015-2016 Actor LLC. <https://actor.im>
*/

import React, { Component, PropTypes } from 'react';
import GroupProfileMembers from '../activity/GroupProfileMembers.react';

class CallBody extends Component {
  static propTypes = {
    group: PropTypes.object.isRequired
  };

  renderMembers() {
    const { group } = this.props;
    return group.members.map((member) => {
      console.debug(member);
      return (
        <li>JSON.stringify(member)</li>
      );
    });
  }

  render() {
    const { group } = this.props;

    return (
      <div className="call__info">
        <GroupProfileMembers groupId={group.id} members={group.members} />
      </div>
    );
  }
}

export default CallBody;
