/*
 * Copyright (C) 2016 Actor LLC. <https://actor.im>
 */

import React, { Component, PropTypes } from 'react';
import { Container } from 'flux/utils';
import Modal from 'react-modal';
import { FormattedMessage } from 'react-intl';
import Select from 'react-select';

import WriteActionCreators from  '../../actions/WriteActionCreators';

import WriteStore from  '../../stores/WriteStore';
import PeopleStore from '../../stores/PeopleStore';

import ContactItem from '../common/ContactItem.react';
import AvatarItem from '../common/AvatarItem.react';
import TextField from '../common/TextField.react';

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

    this.handleClose = this.handleClose.bind(this);
    this.handleSelectChange = this.handleSelectChange.bind(this);
  }

  handleClose() {
    WriteActionCreators.hide();
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
    const { title, selectedContacts, contacts } = this.state;
    console.debug('this.state.selectedContacts', this.state.selectedContacts)

    return (
      <Modal
        overlayClassName="modal-overlay"
        className="modal"
        onRequestClose={this.handleClose}
        isOpen>

        <div className="write">
          <div className="modal__content">

            <div className="modal__header">
              {/*<FormattedMessage id="modal.addContact.title" tagName="h1"/>*/}
              <h1>Write a message</h1>
              <a className="modal__header__close material-icons"
                 onClick={this.handleClose}>clear</a>
            </div>

            <div className="modal__body">
              <div className="write__contacts">
                <Select
                  multi
                  value={selectedContacts}
                  options={contacts}
                  onChange={this.handleSelectChange}
                  placeholder="Select someone"
                  labelKey="name"
                  valueKey="uid"
                  clearable={false}
                  optionRenderer={this.renderContact}
                  valueRenderer={this.renderContact}
                />
              </div>
              <div className="write__title">
                <TextField
                  className="input__material--wide"
                  disabled={false}
                  errorText={null}
                  floatingLabel={'title'}
                  onChange={this.handleTitleChange}
                  ref="name"
                  type="text"
                  value={title}
                />
              </div>
              <div className="write__type row">
                <div className="col-xs">
                  <div className="radio">
                    <input
                      type="radio"
                      name="sendByEnter"
                      id="sendByEnterEnabled"
                      value="true"
                      defaultChecked={true}
                      onChange={this.toggleSendByEnter}/>
                    <label htmlFor="sendByEnterEnabled">
                      Direct
                    </label>
                  </div>
                </div>
                <div className="col-xs">
                  <div className="radio">
                    <input
                      type="radio"
                      name="sendByEnter"
                      id="sendByEnterEnabled"
                      value="true"
                      defaultChecked={true}
                      onChange={this.toggleSendByEnter}/>
                    <label htmlFor="sendByEnterEnabled">
                      Group
                    </label>
                  </div>
                </div>
                <div className="col-xs">
                  <div className="radio">
                    <input
                      type="radio"
                      name="sendByEnter"
                      id="sendByEnterEnabled"
                      value="true"
                      defaultChecked={true}
                      onChange={this.toggleSendByEnter}/>
                    <label htmlFor="sendByEnterEnabled">
                      Channel
                    </label>
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>

      </Modal>
    );
  }
}

export default Container.create(Write, { pure: false });
