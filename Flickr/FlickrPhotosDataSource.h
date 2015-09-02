// Copyright (c) 2015 Lightricks. All rights reserved.
// Created by Barak Yoresh.

#import "FlickrDataSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface FlickrPhotosDataSource : FlickrDataSource

@property (strong, nonatomic) NSArray *flickrPhotos; // Of flickr photo dictionaries.

- (NSURL *)cellImageURLForRowAtIndexPath:(NSIndexPath *)indexPath;

- (NSDictionary *)photoForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
