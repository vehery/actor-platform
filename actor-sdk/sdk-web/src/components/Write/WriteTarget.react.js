/*
 * Copyright (C) 2016 Actor LLC. <https://actor.im>
 */

import React, { Component, PropTypes } from 'react';
import Radio from '../common/Radio';

// import styles from './WriteTarget.css';

class WriteTarget extends Component {
  static propTypes = {
    values: PropTypes.array.isRequired,
    currentValue: PropTypes.string,

    onChange: PropTypes.func.isRequired
  }

  renderValues() {
    const { values, currentValue } = this.props;
    return values.map((radio, index) => {
      return (
        <div className="col-xs">
          <Radio
            key={index}
            id={`radio${index}`}
            checked={radio.value === currentValue}
            label={radio.label}
            onClick={() => this.props.onChange(radio.value)}
          />
        </div>
      );
    })
  }

  render() {
    return (
      <section className="row">
        {this.renderValues()}
      </section>
    );
  }
}

export default WriteTarget;
