// Copyright (c) 2015 Lightricks. All rights reserved.
// Created by Barak Yoresh.

#import "FlickrCachedPhotosTableViewController.h"

#import "FlickrRecentPhotosDataSource.h"
#import "FlickrPhotoCacheManager.h"

NS_ASSUME_NONNULL_BEGIN

@implementation FlickrCachedPhotosTableViewController

- (void)viewDidLoad {
  self.photoDataSource = [[FlickrRecentPhotosDataSource alloc] init];
  [super viewDidLoad];
}

@end

NS_ASSUME_NONNULL_END
