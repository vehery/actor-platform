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

import styles from './Write.css';

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
      selectedContacts: []
    }

    this.handleSelectChange = this.handleSelectChange.bind(this);
  }

  handleSelectChange(value) {
    this.setState({ selectedContacts: value });
  }

  renderContact(contact) {
    return (
      <ContactItem {...contact}/>
    );
  }

  render() {
    console.debug('this.state.selectedContacts', this.state.selectedContacts)
    return (
      <section className="main">
        <div className="flexrow">

          <section className={styles.root}>

            <div className={styles.container}>
              <header className={styles.header}>
                <h1>Write</h1>
              </header>

              <div className={styles.section + ' row'}>
                <div className="title col-xs-12">
                  Whould you like to:
                </div>
                <div className="col-xs-12">
                  <div className="row">
                    <div className="col-xs">
                      <div className={'radio ' + styles.radio}>
                        <input
                          type="radio"
                          name="sendByEnter"
                          id="sendByEnterEnabled"
                          value="true"
                          defaultChecked
                          onChange={this.toggleSendByEnter}/>
                        <label htmlFor="sendByEnterEnabled">
                          Send <strong>Direct message</strong>
                        </label>
                      </div>
                    </div>
                    <div className="col-xs">
                      <div className={'radio ' + styles.radio}>
                        <input
                          type="radio"
                          name="sendByEnter"
                          id="sendByEnterEnabled"
                          value="true"
                          defaultChecked
                          onChange={this.toggleSendByEnter}/>
                        <label htmlFor="sendByEnterEnabled">
                          Start <strong>Group chat</strong>
                        </label>
                      </div>
                    </div>
                    <div className="col-xs">
                      <div className={'radio ' + styles.radio}>
                        <input
                          type="radio"
                          name="sendByEnter"
                          id="sendByEnterEnabled"
                          value="true"
                          defaultChecked
                          onChange={this.toggleSendByEnter}/>
                        <label htmlFor="sendByEnterEnabled">
                          Create <strong>Public channel</strong>
                        </label>
                      </div>
                    </div>
                  </div>
                </div>
              </div>


              <div className={styles.section}>
                <div className="title">
                  Select someone:
                </div>
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
              </div>

              <div className={styles.section}>
                <div className="title">
                  Type your chanel or group title:
                </div>
                <TextField
                  className="input__material--wide"
                  disabled={false}
                  errorText={null}
                  onChange={this.handleTitleChange}
                  ref="name"
                  type="text"
                />
              </div>

              <div className={styles.section}>
                <div className="title">
                  Type your message bellow:
                </div>
                <ComposeTextArea
                  autoFocus={false}
                  className={styles.message}
                  value={''}
                  sendByEnter={false}
                  onSubmit={() => {}}
                  onTyping={() => {}}
                  onKeyDown={() => {}}
                />
              </div>

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
