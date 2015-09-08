// Copyright (c) 2015 Lightricks. All rights reserved.
// Created by Barak Yoresh.

#import "FlickrPhotoByPlaceTableViewController.h"

#import "FlickrPhotosByPlaceDataSource.h"
#import "FlickrPhotoCacheManager.h"
#import "FlickrRecentPhotosDataSource.h"

NS_ASSUME_NONNULL_BEGIN

@implementation FlickrPhotoByPlaceTableViewController

- (void)viewDidLoad {
  FlickrPhotosByPlaceDataSource *photoByPlaceDataSource =
  [[FlickrPhotosByPlaceDataSource alloc] init];
  photoByPlaceDataSource.flickrPlaceID = self.flickrPlaceID;
  self.photoDataSource = photoByPlaceDataSource;
  [super viewDidLoad];
}

- (void)prepareImageViewController:(ImageViewController *)imageViewController
                      forIndexPath:(NSIndexPath *)indexPath {
  [super prepareImageViewController:imageViewController forIndexPath:indexPath];
  FlickrPhotosDataSource *imageDataSource = (FlickrPhotosDataSource *) self.dataSource;
  
  NSDictionary *photo = [imageDataSource photoForRowAtIndexPath:indexPath];
  [self cachePhoto:photo];
}

- (void)cachePhoto:(NSDictionary *)photo {
  [FlickrPhotoCacheManager addPhoto:photo ForKey:FLICKR_RECENT_PHOTOS_CHACHE_MANAGER_KEY];
}

@end

NS_ASSUME_NONNULL_END
