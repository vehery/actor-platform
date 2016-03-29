/*
 * Copyright (C) 2015-2016 Actor LLC. <https://actor.im>
 */

import React, { Component, PropTypes } from 'react';
import SharedContainer from '../utils/SharedContainer';
import { appName } from '../constants/ActorAppConstants';

import WelcomeMessage from './login/WelcomeMessage.react';
import LoginForm from './login/LoginForm.react';

class Login extends Component {
  constructor(props) {
    super(props);

    const SharedActor = SharedContainer.get();
    this.appName = SharedActor.appName ? SharedActor.appName : appName;
  }

  render() {
    return (
      <section className="login">
        <WelcomeMessage appName={this.appName} />
        <LoginForm />
      </section>
    );
  }
}

export default Login;
