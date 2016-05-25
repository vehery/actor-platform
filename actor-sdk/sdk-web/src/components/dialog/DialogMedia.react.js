/*
* Copyright (C) 2015-2016 Actor LLC. <https://actor.im>
*/

import React, { Component, PropTypes } from 'react';
// import { FormattedMessage } from 'react-intl';
// import classnames from 'classnames';
import { PhotoSwipeGallery } from 'react-photoswipe';
import DialogMediaActionCreators from '../../actions/DialogMediaActionCreators';

class DialogMedia extends Component {
  static propTypes = {
    images: PropTypes.array.isRequired,
    isLoading: PropTypes.bool.isRequired
  };

  constructor(props) {
    super(props);
    console.debug(props);
  }

  componentDidMount() {
    DialogMediaActionCreators.findAllPhotos();
  }

  getThumbnailContent(item) {
    console.debug(item)
    return (
      <img src={item.thumbnail}/>
    );
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

  render() {
    const { isLoading } = this.props;

    if (isLoading) {
      return (
        <div>Loading</div>
      );
    }

    const galleryOptions = {
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
      tapToToggleControls: false
    };

    return (
      <div className="dialog__media">
        <PhotoSwipeGallery
          items={this.getImages()}
          options={galleryOptions}
          thumbnailContent={this.getThumbnailContent}
        />
      </div>
    );
  }
}

export default DialogMedia;
