/*
 * Copyright (C) 2015-2016 Actor LLC. <https://actor.im>
 */

import 'setimmediate';
import initPollyfils from '../utils/polyfills';

import Actor from 'actor-js';
import DelegateContainer from '../utils/DelegateContainer';
import SharedContainer from '../utils/SharedContainer';
import PeerUtils from '../utils/PeerUtils';
import SDKDelegate from './actor-sdk-delegate';
import { endpoints, rootElement, homePage, twitter, helpPhone, appName } from '../constants/ActorAppConstants'
import Pace from 'pace';
import { isFunction } from 'lodash';

import React from 'react';
import { render } from 'react-dom';
import { Router, Route, IndexRoute, IndexRedirect } from 'react-router';
import history from '../utils/history';
import { IntlProvider } from 'react-intl';
import crosstab from 'crosstab';
import { lightbox } from '../utils/ImageUtils'

import LoginActionCreators from '../actions/LoginActionCreators';
import {loggerAppend} from '../actions/LoggerActionCreators';
import defaultLogHandler from '../utils/defaultLogHandler';

import LoginStore from '../stores/LoginStore';

import Modal from 'react-modal';

import { extendL18n, getIntlData } from '../l18n';

const ACTOR_INIT_EVENT = 'INIT';

// Init app loading progressbar
Pace.start({
  ajax: false,
  restartOnRequestAfter: false,
  restartOnPushState: false
});

// Init lightbox
lightbox.load({
  animation: false,
  controlClose: '<i class="material-icons">close</i>'
});

window.isJsAppLoaded = false;
window.jsAppLoaded = () => window.isJsAppLoaded = true;

/**
 * Class represents ActorSKD itself
 *
 * @param {object} options - Object contains custom components, actions and localisation strings.
 */
class ActorSDK {
  constructor(options = {}) {
    this.endpoints = (options.endpoints && options.endpoints.length > 0) ? options.endpoints : endpoints;
    this.logHandler = isFunction(options.logHandler) ? options.logHandler : this.createLogHandler();
    this.isExperimental = options.isExperimental ? options.isExperimental : false;
    this.forceLocale = options.forceLocale ? options.forceLocale : null;
    this.rootElement = options.rootElement ? options.rootElement : rootElement;
    this.homePage = options.homePage ? options.homePage : homePage;
    this.twitter = options.twitter ? options.twitter : twitter;
    this.helpPhone = options.helpPhone ? options.helpPhone : helpPhone;
    this.appName = options.appName ? options.appName : appName;
    this.delegate = options.delegate ? options.delegate : new SDKDelegate();

    DelegateContainer.set(this.delegate);

    if (this.delegate.l18n) extendL18n();

    SharedContainer.set(this);
  }

  createLogHandler() {
    if (localStorage.debug) {
      return loggerAppend;
    }

    return defaultLogHandler;
  }

  _starter = () => {
    if (crosstab.supported) {
      crosstab.on(ACTOR_INIT_EVENT, (msg) => {
        if (msg.origin !== crosstab.id && window.location.hash !== '#/deactivated') {
          history.push('deactivated');
        }
      });
    }

    const appRootElemet = document.getElementById(this.rootElement);

    if (window.location.hash !== '#/deactivated') {
      if (crosstab.supported) crosstab.broadcast(ACTOR_INIT_EVENT, {});
      window.messenger = Actor.create({
        endpoints: this.endpoints,
        logHandler: this.logHandler
      });
    }

    const intlData = getIntlData(this.forceLocale);
    const router = this.createRouter();
    const root = (
      <IntlProvider {...intlData}>
        {router}
      </IntlProvider>
    );

    render(root, appRootElemet);

    // initial setup fot react modal
    Modal.setAppElement(appRootElemet);

    if (window.location.hash !== '#/deactivated') {
      if (LoginStore.isLoggedIn()) {
        LoginActionCreators.setLoggedIn({redirect: false});
      }
    }
  };

  createRouter() {
    const requireAuth = (nextState, replaceState) => {
      if (!LoginStore.isLoggedIn()) {
        replaceState({
          pathname: '/auth',
          state: {nextPathname: nextState.location.pathname}
        });
      }
    };

    function checkPeer(nextState, replaceState) {
      const peer = PeerUtils.stringToPeer(nextState.params.id);
      if (!PeerUtils.hasPeer(peer)) {
        console.error('Invalig peer', nextState);
        replaceState('/im');
      }
    }

    const { delegate, isExperimental } = this;

    /**
     * Method for pulling props to router components
     *
     * @param RoutedComponent component for extending
     * @param props props to extend
     * @returns {object} extended component
     */
    const createElement = (Component, props) => {
      return <Component {...props} delegate={delegate} isExperimental={isExperimental}/>;
    };

    const { routes } = delegate;

    return (
      <Router history={history} createElement={createElement}>
        <Route {...routes.index}>
          <Route {...routes.auth} />
          <Route {...routes.install} />
          <Route {...routes.deactivated} />
          <Route {...routes.join} onEnter={requireAuth} />

          <Route {...routes.im} onEnter={requireAuth}>
            <Route {...routes.im.archive} />
            <Route {...routes.im.dialog} onEnter={checkPeer} />
            <IndexRoute {...routes.im.index} />
          </Route>

          <IndexRedirect to={routes.im.path} />
        </Route>
      </Router>
    );
  }

  /**
   * Start application
   */
  startApp() {
    const start = () => {
      if (window.isJsAppLoaded) {
        this._starter();
      } else {
        window.jsAppLoaded = this._starter;
      }
    };

    initPollyfils(start);
  }
}

export default ActorSDK;
