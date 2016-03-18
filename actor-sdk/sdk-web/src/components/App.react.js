/*
 * Copyright (C) 2016 Actor LLC. <https://actor.im>
 */

import React, { Component, PropTypes } from 'react';
import LocationContainer from '../utils/LocationContainer';

/**
 * Root react component
 */
class App extends Component {
  static propTypes = {
    delegate: PropTypes.object.isRequired,
    isExperimental: PropTypes.bool.isRequired,
    children: PropTypes.node.isRequired,
    location: PropTypes.object.isRequired
  };

  static childContextTypes = {
    delegate: PropTypes.object,
    isExperimental: PropTypes.bool
  };

  getChildContext() {
    const { delegate, isExperimental } = this.props;
    return {
      delegate, isExperimental
    };
  }

  constructor(props) {
    super(props);

    LocationContainer.set(props.location);
  }

  render() {
    return this.props.children;
  }
}

export default App;
