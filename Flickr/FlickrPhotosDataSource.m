// Copyright (c) 2015 Lightricks. All rights reserved.
// Created by Barak Yoresh.

#import "FlickrPhotosDataSource.h"

#import "FlickrFetcher.h"

NS_ASSUME_NONNULL_BEGIN

#define ROW_IN_SECTION_INDEX 1
#define DEFAULT_TITLE @"Unknown"

@implementation FlickrPhotosDataSource

- (NSInteger)numberOfSections {
  return 1;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
  return [self.flickrPhotos count];
}

- (NSString *)cellTitleForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSDictionary *photo = [self photoForRowAtIndexPath:indexPath];
  NSString *title = [photo valueForKeyPath:FLICKR_PHOTO_TITLE];
  return [title isEqual:@""] ? DEFAULT_TITLE : title;
}

- (NSString *)cellSubTitleForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSDictionary *photo = [self photoForRowAtIndexPath:indexPath];
  return [photo valueForKeyPath:FLICKR_PHOTO_DESCRIPTION];
}

- (NSURL *)cellImageURLForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSDictionary *photo = [self photoForRowAtIndexPath:indexPath];
  return [FlickrFetcher URLforPhoto:photo format:FlickrPhotoFormatLarge];
}

- (NSDictionary *)photoForRowAtIndexPath:(NSIndexPath *)indexPath {
  return self.flickrPhotos[[indexPath indexAtPosition:ROW_IN_SECTION_INDEX]];
}

@end

NS_ASSUME_NONNULL_END
