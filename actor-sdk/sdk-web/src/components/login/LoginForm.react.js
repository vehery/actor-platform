/*
 * Copyright (C) 2016 Actor LLC. <https://actor.im>
 */

import React, { Component, PropTypes } from 'react';
import { Container } from 'flux/utils';
import classnames from 'classnames';
import { FormattedMessage } from 'react-intl';
import { AuthSteps } from '../../constants/ActorAppConstants';

import LoginActionCreators from '../../actions/LoginActionCreators';

import LoginStore from '../../stores/LoginStore';

import TextField from '../common/TextField.react';

class LoginForm extends Component {
  static getStores() {
    return [LoginStore];
  }

  static calculateState() {
    return {
      login: LoginStore.getLogin(),
      code: LoginStore.getCode(),
      name: LoginStore.getName(),
      step: LoginStore.getStep(),
      errors: LoginStore.getErrors(),
      isCodeRequested: LoginStore.isCodeRequested(),
      isCodeSended: LoginStore.isCodeSended(),
      isSignupStarted: LoginStore.isSignupStarted()
    }
  };

  static contextTypes = {
    intl: PropTypes.object
  };

  constructor(props) {
    super(props);

    this.onLoginChange = this.onLoginChange.bind(this);
    this.onCodeChange = this.onCodeChange.bind(this);
    this.onNameChange = this.onNameChange.bind(this);

    this.onRequestCode = this.onRequestCode.bind(this);
    this.onSendCode = this.onSendCode.bind(this);
    this.onSignupRequested = this.onSignupRequested.bind(this);

    this.handleRestartAuthClick = this.handleRestartAuthClick.bind(this);
    this.handleFocus = this.handleFocus.bind(this);
  }

  componentDidMount() {
    this.handleFocus();
  }

  componentDidUpdate() {
    this.handleFocus();
  }

  // From change handlers
  onLoginChange(event) {
    event.preventDefault();
    LoginActionCreators.changeLogin(event.target.value);
  }

  onCodeChange(event) {
    event.preventDefault();
    LoginActionCreators.changeCode(event.target.value);

    // Check code
    if (event.target.value.length === 5) {
      LoginActionCreators.sendCode(event.target.value);
    }
  }

  onNameChange(event) {
    event.preventDefault();
    LoginActionCreators.changeName(event.target.value);
  }

  // Form submit handlers
  onRequestCode(event) {
    event.preventDefault();
    LoginActionCreators.requestCode(this.state.login);
  }

  onSendCode(event) {
    event.preventDefault();
    LoginActionCreators.sendCode(this.state.code);
  }

  onSignupRequested(event) {
    event.preventDefault();
    LoginActionCreators.sendSignup(this.state.name);
  }

  handleRestartAuthClick(event) {
    event.preventDefault();
    LoginActionCreators.restartAuth();
  };

  handleFocus() {
    const { step } = this.state;

    switch (step) {
      case AuthSteps.LOGIN_WAIT:
        this.refs.login.focus();
        break;
      case AuthSteps.CODE_WAIT:
        this.refs.code.focus();
        break;
      case AuthSteps.NAME_WAIT:
        this.refs.name.focus();
        break;
      default:
    }
  };

  renderSpinner() {
    return (
      <div className="spinner">
        <div/><div/><div/><div/><div/><div/>
        <div/><div/><div/><div/><div/><div/>
      </div>
    )
  }

  renderLoginForm() {
    const { step, errors, login, isCodeRequested } = this.state;
    const { intl } = this.context;

    const requestFormClassName = classnames('login__form login__form--request', {
      'login__form--active': step === AuthSteps.LOGIN_WAIT,
      'login__form--done': step !== AuthSteps.LOGIN_WAIT && isCodeRequested
    });

    return (
      <form className={requestFormClassName} onSubmit={this.onRequestCode}>
        <a className="wrong" onClick={this.handleRestartAuthClick}><FormattedMessage id="login.wrong"/></a>
        <TextField
          className="login__form__input"
          disabled={isCodeRequested || step !== AuthSteps.LOGIN_WAIT}
          errorText={errors.login}
          floatingLabel={intl.messages['login.phone_or_email']}
          onChange={this.onLoginChange}
          ref="login"
          value={login}
          wide
        />
        <footer className="text-center">
          <button className="button button--rised button--primary button--wide"
                  type="submit"
                  disabled={isCodeRequested}>
            <FormattedMessage id="button.requestCode"/>
            {isCodeRequested ? this.renderSpinner() : null}
          </button>
        </footer>
      </form>
    )
  }

  renderCheckCodeForm() {
    const { step, errors, code, isCodeRequested, isCodeSended } = this.state;
    const { intl } = this.context;

    if (step === AuthSteps.LOGIN_WAIT) return null;

    const checkFormClassName = classnames('login__form login__form--check', {
      'login__form--active': step === AuthSteps.CODE_WAIT && isCodeRequested,
      'login__form--done': step !== AuthSteps.CODE_WAIT && isCodeSended
    });

    return (
      <form className={checkFormClassName} onSubmit={this.onSendCode}>
        <TextField
          className="login__form__input"
          disabled={isCodeSended || step !== AuthSteps.CODE_WAIT}
          errorText={errors.code}
          floatingLabel={intl.messages['login.authCode']}
          onChange={this.onCodeChange}
          ref="code"
          type="text"
          value={code}
          wide
        />
        <footer className="text-center">
          <button className="button button--rised button--primary button--wide"
                  type="submit"
                  disabled={isCodeSended}>
            <FormattedMessage id="button.checkCode"/>
            {isCodeSended ? this.renderSpinner() : null}
          </button>
        </footer>
      </form>
    )
  }

  renderSignUpFrom() {
    const { step, errors, name, isSignupStarted } = this.state;
    const { intl } = this.context;

    if (step === AuthSteps.LOGIN_WAIT || step === AuthSteps.CODE_WAIT) return null;

    const signupFormClassName = classnames('login__form login__form--signup', {
      'login__form--active': step === AuthSteps.NAME_WAIT
    });

    return (
      <form className={signupFormClassName} onSubmit={this.onSignupRequested}>
        <TextField
          className="login__form__input"
          disabled={isSignupStarted || step === AuthSteps.COMPLETED}
          errorText={errors.signup}
          floatingLabel={intl.messages['login.yourName']}
          onChange={this.onNameChange}
          ref="name"
          type="text"
          value={name}
          wide
        />
        <footer className="text-center">
          <button className="button button--rised button--primary button--wide"
                  type="submit"
                  disabled={isSignupStarted}>
            <FormattedMessage id="button.signUp"/>
            {isSignupStarted ? this.renderSpinner() : null}
          </button>
        </footer>
      </form>
    )
  }

  render() {
    return (
      <section className="login__forms">
        <h1 className="login__forms__heading text-center">
          <FormattedMessage id="login.signIn"/>
        </h1>

        {this.renderLoginForm()}
        {this.renderCheckCodeForm()}
        {this.renderSignUpFrom()}
      </section>
    );
  }
}

export default Container.create(LoginForm, {pure: false});
