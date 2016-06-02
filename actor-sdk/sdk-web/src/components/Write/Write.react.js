/*
 * Copyright (C) 2016 Actor LLC. <https://actor.im>
 */

import React, { Component } from 'react';
import { Container } from 'flux/utils';
// import { FormattedMessage } from 'react-intl';
import Select from 'react-select';

// import WriteActionCreators from  '../actions/WriteActionCreators';

import WriteStore from  '../../stores/WriteStore';
import PeopleStore from '../../stores/PeopleStore';

import ContactItem from '../common/ContactItem.react';
// import AvatarItem from './common/AvatarItem.react';
import TextField from '../common/TextField.react';
import ComposeTextArea from '../dialog/compose/ComposeTextArea.react';
import WriteSection from './WriteSection.react';
import WriteTarget from './WriteTarget.react';

import styles from './Write.css';

const WriteTargetTypes = {
  DIRECT: 'direct',
  GROUP: 'group',
  CHANNEL: 'channel'
}

class Write extends Component {
  static getStores() {
    return [WriteStore, PeopleStore];
  }

  static calculateState(prevState) {
    return {
      ...prevState,
      contacts: PeopleStore.getState()
    }
  }

  constructor(props, context) {
    super(props, context);

    this.state = {
      selectedContacts: [],
      target: null
    }

    this.handleSelectChange = this.handleSelectChange.bind(this);
    this.handleTargetChange = this.handleTargetChange.bind(this);
  }

  handleSelectChange(value) {
    this.setState({ selectedContacts: value });
  }

  renderContact(contact) {
    return (
      <ContactItem {...contact}/>
    );
  }

  getTargetValues() {
    return [{
      value: WriteTargetTypes.DIRECT,
      label: <span>Send <strong>Direct message</strong></span>
    },{
      value: WriteTargetTypes.GROUP,
      label: <span>Start <strong>Group chat</strong></span>
    },{
      value: WriteTargetTypes.CHANNEL,
      label: <span>Create <strong>Public channel</strong></span>
    }]
  }

  handleTargetChange(value) {
    console.debug('handleTargetChange', value)
    this.setState({ target: value });
  }

  render() {
    return (
      <section className="main">
        <div className="flexrow">

          <section className={styles.root}>

            <div className={styles.container}>
              <header className={styles.header}>
                Write
              </header>

              <WriteSection title="Whould you like to:">
                <WriteTarget
                  values={this.getTargetValues()}
                  currentValue={this.state.target}
                  onChange={this.handleTargetChange}
                />
              </WriteSection>


              <WriteSection title="Select someone:">
                <Select
                  multi
                  value={this.state.selectedContacts}
                  options={this.state.contacts}
                  onChange={this.handleSelectChange}
                  placeholder=""
                  labelKey="name"
                  valueKey="uid"
                  clearable={false}
                  optionRenderer={this.renderContact}
                  valueRenderer={this.renderContact}
                />
              </WriteSection>

              <WriteSection title="Type your chanel or group title:">
                <TextField
                  className="input__material--wide"
                  disabled={false}
                  errorText={null}
                  onChange={this.handleTitleChange}
                  ref="name"
                  type="text"
                />
              </WriteSection>

              <WriteSection title="Type your message bellow:">
                <ComposeTextArea
                  autoFocus={false}
                  className={styles.message}
                  value={''}
                  sendByEnter={false}
                  onSubmit={() => {}}
                  onTyping={() => {}}
                  onKeyDown={() => {}}
                />
              </WriteSection>

              <footer className={styles.footer}>
                <div className="controls">
                  <button className="button button--rised">Send</button>
                </div>
              </footer>

            </div>
          </section>

        </div>
      </section>
    );
  }
}

export default Container.create(Write, { pure: false });
