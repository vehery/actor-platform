/*
 * Copyright (C) 2016 Actor LLC. <https://actor.im>
 */

import React, { Component, PropTypes } from 'react';
import { FormattedMessage, FormattedHTMLMessage } from 'react-intl';

export default class WelcomeMessage extends Component {
  static propTypes = {
    appName: PropTypes.string.isRequired
  }

  render() {
    const { appName } = this.props;

    return (
      <div className="login__welcome">
        <header className="login__welcome__header">
          <img alt={`${appName} messenger`}
               className="logo"
               src="assets/images/logo.png"
               srcSet="assets/images/logo@2x.png 2x"/>
        </header>

         <article className="login__welcome__body">
          <h1>
            <FormattedHTMLMessage id="login.welcome.header" values={{appName}}/>
          </h1>

          <FormattedHTMLMessage id="login.welcome.text" values={{appName}}/>
        </article>

        <footer className="login__welcome__footer">
          <div className="pull-left">
            <FormattedMessage id="login.welcome.copyright" values={{appName}}/>
          </div>
          <div className="pull-right">
            <a href="//actorapp.ghost.io/desktop-apps">Desktop</a>&nbsp;&nbsp;•&nbsp;&nbsp;
            <a href="//actor.im/ios">iPhone</a>&nbsp;&nbsp;•&nbsp;&nbsp;
            <a href="//actor.im/android">Android</a>
          </div>
        </footer>
      </div>
    );
  }
}
