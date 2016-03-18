/*
 * Copyright (C) 2015-2016 Actor LLC. <https://actor.im>
 */

import React, { Component, PropTypes } from 'react';

class DialogFooter extends Component {
  static propTypes = {
    isMember: PropTypes.bool.isRequired
  };

  static contextTypes = {
    delegate: PropTypes.object.isRequired
  };

  constructor(props, context) {
    super(props, context);

    this.components = this.context.delegate.components.dialog;
  }

  render() {
    if (!this.props.isMember) {
      return (
        <footer className="dialog__footer dialog__footer--disabled row center-xs middle-xs">
          <h3>You are not a member</h3>
        </footer>
      );
    }

    const {TypingSection, ComposeSection} = this.components;

    return (
      <footer className="dialog__footer">
        <TypingSection />
        <ComposeSection />
      </footer>
    );
  }
}

export default DialogFooter;
