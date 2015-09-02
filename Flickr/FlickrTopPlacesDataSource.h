// Copyright (c) 2015 Lightricks. All rights reserved.
// Created by Barak Yoresh.

#import "FlickrDataSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface FlickrTopPlacesDataSource : FlickrDataSource

// Flickr place id used to fetch photos from specific location.
- (id)cellPlaceIDForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
