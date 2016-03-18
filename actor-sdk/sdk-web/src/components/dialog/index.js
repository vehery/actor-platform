/*
 * Copyright (C) 2015-2016 Actor LLC. <https://actor.im>
 */

import Toolbar from '../Toolbar.react';
import MessagesSection from './MessagesSection.react';
import TypingSection from './TypingSection.react';
import ComposeSection from './ComposeSection.react';
import DialogFooter from './DialogFooter.react';

// activity
import Activity from '../Activity.react';
import Call from '../Call.react';
import LoggerSection from '../dev/LoggerSection.react';

// messages
import Message from './messages/MessageItem.react';
import Service from './messages/Service.react';
import Text from './messages/Text.react';
import Photo from './messages/Photo.react.js';
import Document from './messages/Document.react';
import Voice from './messages/Voice.react';
import Contact from './messages/Contact.react';
import Location from './messages/Location.react.js';
import Modern from './messages/Modern.react.js';
import Sticker from './messages/Sticker.react.js';

const activity = [
  Activity,
  Call,
  LoggerSection
];

const messages = {
  Message,
  Service,
  Text,
  Photo,
  Document,
  Voice,
  Contact,
  Location,
  Modern,
  Sticker
};

export {
  Toolbar,
  MessagesSection,
  TypingSection,
  ComposeSection,
  DialogFooter,
  activity,
  messages
};
