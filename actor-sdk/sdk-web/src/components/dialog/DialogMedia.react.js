/*
* Copyright (C) 2015-2016 Actor LLC. <https://actor.im>
*/

import React, { Component, PropTypes } from 'react';
// import { FormattedMessage } from 'react-intl';
// import classnames from 'classnames';
import { PhotoSwipe } from 'react-photoswipe';
import DialogMediaActionCreators from '../../actions/DialogMediaActionCreators';

class DialogMedia extends Component {
  static propTypes = {
    images: PropTypes.array.isRequired,
    isLoading: PropTypes.bool.isRequired
  };

  constructor(props) {
    super(props);
    console.debug(props);

    this.state = {
      galleryImageIndex: 0,
      isPhotoSwipeOpen: false
    };

    this.handlePhotoSwipeClose = this.handlePhotoSwipeClose.bind(this);
    this.handlePhotoSwipeOpen = this.handlePhotoSwipeOpen.bind(this);
  }

  componentDidMount() {
    DialogMediaActionCreators.findAllPhotos();
  }

  handlePhotoSwipeOpen(index) {
    console.debug('handlePhotoSwipeOpen', index)
    this.setState({
      isPhotoSwipeOpen: true,
      galleryImageIndex: index
    })
  }

  handlePhotoSwipeClose() {
    this.setState({ isPhotoSwipeOpen: false })
  }

  getImages() {
    const { images } = this.props;

    return images.map((image) => {
      console.debug(image);
      return {
        src: image.content.fileUrl,
        thumbnail: image.content.preview,
        w: image.content.w,
        h: image.content.h,
        title: image.content.fileName
      }
    });
  }

  renderDialogPhotos() {
    const gallery = this.getImages();
    if (!gallery.length) return null;

    return gallery.map((image, index) => {
      return (
        <div className="image col-xs-12 col-sm-6 col-md-4 col-lg-3" key={index} >
          <img src={image.thumbnail} alt={image.title} onClick={() => this.handlePhotoSwipeOpen(index)}/>
        </div>
      );
    })
  }

  render() {
    const { isLoading } = this.props;
    const { isPhotoSwipeOpen, galleryImageIndex } = this.state;

    if (isLoading) {
      return (
        <div className="dialog__media dialog__media--loading">
          <div className="preloader"><div/><div/><div/><div/><div/></div>
        </div>
      );
    }

    const galleryOptions = {
      index: galleryImageIndex,
      mainClass: 'pswp--minimal--dark',
      barsSize: {
        top: 0,
        bottom:0
      },
      captionEl: false,
      fullscreenEl: false,
      shareEl: false,
      bgOpacity: 0.85,
      tapToClose: true,
      tapToToggleControls: false,
      showAnimationDuration: 0,
      hideAnimationDuration: 0
    };

    return (
      <div className="dialog__media">

        <div className="row">
          {this.renderDialogPhotos()}
        </div>

        <PhotoSwipe
          isOpen={isPhotoSwipeOpen}
          items={this.getImages()}
          options={galleryOptions}
          onClose={this.handlePhotoSwipeClose}
        />

      </div>
    );
  }
}

export default DialogMedia;
