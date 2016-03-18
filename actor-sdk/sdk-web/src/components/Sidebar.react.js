/*
 * Copyright (C) 2015-2016 Actor LLC. <https://actor.im>
 */

import React, { Component, PropTypes } from 'react';
import { Container } from 'flux/utils';

import DefaultHeaderSection from './sidebar/HeaderSection.react';
import DefaultRecent from './sidebar/Recent.react';
import QuickSearchButton from './sidebar/QuickSearchButton.react';

import DialogStore from '../stores/DialogStore';
import ArchiveStore from '../stores/ArchiveStore';

class SidebarSection extends Component {
  static contextTypes = {
    delegate: PropTypes.object.isRequired
  };

  static getStores() {
    return [DialogStore, ArchiveStore];
  }

  static calculateState() {
    return {
      currentPeer: DialogStore.getCurrentPeer(),
      dialogs: DialogStore.getDialogs(),
      archive: ArchiveStore.getArchiveChatState()
    };
  };

  constructor(props, context) {
    super(props, context);
    
    this.components = context.delegate.components.sidebar;
  }

  render() {
    const { currentPeer, dialogs, archive } = this.state;
    const { HeaderSection, RecentSection, FooterSection } = this.components;

    return (
      <aside className="sidebar">
        <HeaderSection />
        <RecentSection
          currentPeer={currentPeer}
          dialogs={dialogs}
          archive={archive}
        />
        <FooterSection/>
      </aside>
    );
  }
}

export default Container.create(SidebarSection);
