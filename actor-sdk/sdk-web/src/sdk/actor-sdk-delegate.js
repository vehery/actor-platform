/*
 * Copyright (C) 2015-2016 Actor LLC. <https://actor.im>
 */

import defaults from 'lodash/defaults';
import defaultsDeep from 'lodash/defaultsDeep';

import LoginActionCreators from '../actions/LoginActionCreators';

// routes
import App from '../components/App.react';
import Login from '../components/Login.react';
import Install from '../components/Install.react';
import Deactivated from '../components/Deactivated.react';
import Join from '../components/Join.react';
import Main from '../components/Main.react';
import Archive from '../components/Archive.react';
import Dialog from '../components/Dialog.react';
import Empty from '../components/Empty.react';

// components
import * as dialog from '../components/dialog';
import * as sidebar from '../components/sidebar';


/**
 * Class representing a delegate for overriding default app behaviour.
 *
 * @param {object} components - Object contains custom react components.
 * @param {object} actions - Object contains custom actions.
 * @param {object} l18n - Object contains custom translations.
 */
class ActorSDKDelegate {
  constructor({routes = {}, components = {}, actions = {}, l18n = {}}) {
    this.components = defaultsDeep(components, this.getDefaultComponents());
    this.actions = defaults(actions, this.getDefaultActions());
    this.routes = defaultsDeep(routes, this.getDefaultRoutes());

    this.l18n = l18n;
  }

  getDefaultComponents() {
    return {
      dialog,
      sidebar
    };
  }

  getDefaultActions() {
    return {
      setLoggedIn: LoginActionCreators.setLoggedIn,
      setLoggedOut: LoginActionCreators.setLoggedOut
    };
  }

  getDefaultRoutes() {
    return {
      index: {
        path: '/',
        component: App
      },
      login: {
        path: 'auth',
        component: Login
      },
      install: {
        path: 'install',
        component: Install
      },
      deactivated: {
        path: 'deactivated',
        component: Deactivated
      },
      join: {
        path: 'join/:token',
        component: Join
      },
      im: {
        path: 'im',
        component: Main,
        archive: {
          path: 'archive',
          component: Archive
        },
        dialog: {
          path: ':id',
          component: Dialog
        },
        index: {
          component: Empty
        }
      },
    };
  }
}

export default ActorSDKDelegate;
