// Copyright (c) 2015 Lightricks. All rights reserved.
// Created by Barak Yoresh.

#import "FlickrPlacesDataSource.h"

NS_ASSUME_NONNULL_BEGIN

@implementation FlickrPlacesDataSource

#pragma mark - abstract
- (id)cellPlaceIDForRowAtIndexPath:(NSIndexPath *)indexPath {
  assert(NO);
  return nil;
}

@end

NS_ASSUME_NONNULL_END
