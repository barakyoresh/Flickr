// Copyright (c) 2015 Lightricks. All rights reserved.
// Created by Barak Yoresh.

#import "FlickrPhotosDataSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface FlickrPhotosByPlaceDataSource : FlickrPhotosDataSource

// Flickr place id from which to pull photos
@property (strong, nonatomic) id flickrPlaceID;

@end

NS_ASSUME_NONNULL_END
