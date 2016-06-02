/*
 * Copyright (C) 2016 Actor LLC. <https://actor.im>
 */

import React, { Component, PropTypes } from 'react';
import { FormattedMessage } from 'react-intl';
import styles from './WriteSection.css';

class WriteSection extends Component {
  static propTypes = {
    title: PropTypes.string.isRequired,
    children: PropTypes.node.isRequired
  };

  render() {
    return (
      <div className={styles.container}>
        <div className={styles.title}>
          <FormattedMessage id={this.props.title} />
        </div>
        <div className={styles.body}>
          {this.props.children}
        </div>
      </div>
    );
  }
}

export default WriteSection;
