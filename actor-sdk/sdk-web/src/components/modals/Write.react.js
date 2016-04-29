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


class ContactIt2m extends Component {
  static propTypes = {
    avatar: PropTypes.string.isRequired,
    name: PropTypes.string.isRequired,
    placeholder: PropTypes.string.isRequired,
    uid: PropTypes.number.isRequired,
    avatarSize: PropTypes.string
  }

  render() {
    const { avatar, name, placeholder, avatarSize } = this.props;

    return (
      <div className="select-contact row">
        <AvatarItem
          image={avatar}
          className="select-contact"
          placeholder={placeholder}
          size={avatarSize ||'tiny'}
          title={name}
        />
        <div className="select-contact__title col-xs">{name}</div>
      </div>
    );
  }
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
              <FormattedMessage id="modal.addContact.title" tagName="h1"/>
              <a className="modal__header__close material-icons"
                 onClick={this.handleClose}>clear</a>
            </div>
            <div className="modal__body">
              <div className="write__contacts">
                <Select
                  multi
                  value={this.state.selectedContacts}
                  options={this.state.contacts}
                  onChange={this.handleSelectChange}
                  placeholder="Select someone"
                  labelKey="name"
                  valueKey="uid"
                  clearable={false}
                  optionRenderer={this.renderContact}
                  valueRenderer={this.renderContact}
                />
              </div>
            </div>
          </div>
        </div>

      </Modal>
    );
  }
}

export default Container.create(Write, { pure: false });
