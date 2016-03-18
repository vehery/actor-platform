/*
 * Copyright (C) 2015-2016 Actor LLC. <https://actor.im>
 */

import ActorSDK from '../src/sdk/actor-sdk';
import ActorSDKDelegate from '../src/sdk/actor-sdk-delegate';

const delegate = new ActorSDKDelegate({
  routes: {},
  components: {},
  actions: {},
  l18n: {}
});

const app = new ActorSDK({
  delegate,
  endpoints: [
    'wss://front1-ws-mtproto-api-rev2.actor.im',
    'wss://front2-ws-mtproto-api-rev2.actor.im'
  ],
  isExperimental: true
});

app.startApp();
