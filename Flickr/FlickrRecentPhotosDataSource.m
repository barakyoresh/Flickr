// Copyright (c) 2015 Lightricks. All rights reserved.
// Created by Barak Yoresh.

#import "FlickrRecentPhotosDataSource.h"

#import "FlickrPhotoCacheManager.h"

NS_ASSUME_NONNULL_BEGIN

@implementation FlickrRecentPhotosDataSource

- (void)loadData:(void (^)(NSError *))completion {
  NSError* error = nil;
  self.flickrPhotos =
      [FlickrPhotoCacheManager getPhotosForKey:FLICKR_RECENT_PHOTOS_CHACHE_MANAGER_KEY];
  completion(error);
}

@end

NS_ASSUME_NONNULL_END
