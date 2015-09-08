// Copyright (c) 2015 Lightricks. All rights reserved.
// Created by Barak Yoresh.

#import "FlickrDataSource.h"

NS_ASSUME_NONNULL_BEGIN

@implementation FlickrDataSource

- (NSInteger)numberOfSections {
  return 1;
}

- (NSString *)titleForHeaderInSection:(NSUInteger)section {
  return nil;
}

#pragma mark - abstract

- (NSString *)cellTitleForRowAtIndexPath:(NSIndexPath *)indexPath {
  assert(NO); return nil;
}

- (NSString *)cellSubTitleForRowAtIndexPath:(NSIndexPath *)indexPath {
  assert(NO); return nil;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
  assert(NO); return 0;
}

- (void) loadData:(void (^)(NSError *error))competion {
  assert(NO);
}

@end

NS_ASSUME_NONNULL_END
