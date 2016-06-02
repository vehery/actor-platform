import React, { Component, PropTypes } from 'react';
import classnames from 'classnames';

import styles from './Radio.css';

class Radio extends Component {
  static propTypes = {
    id: PropTypes.string.isRequired,
    checked: PropTypes.bool.isRequired,
    label: PropTypes.any.isRequired,

    className: PropTypes.string,
    inputClassName: PropTypes.string,
    labelClassName: PropTypes.string,

    onClick: PropTypes.func.isRequired
  }

  render() {
    const radioClassName = classnames(styles.root, this.props.className);
    const inputClassName = classnames(styles.input, this.props.inputClassName);
    const labelClassName = classnames(styles.label, this.props.labelClassName);

    return (
      <div className={radioClassName} onClick={this.props.onClick}>
        <input
          className={inputClassName}
          checked={this.props.checked}
          type="radio"
          id={this.props.id}
        />
        <label className={labelClassName} htmlFor={this.props.id}>
          {this.props.label}
        </label>
      </div>
    );
  }
}

export default Radio;
