// Copyright (c) 2015 Lightricks. All rights reserved.
// Created by Barak Yoresh.

#import <UIKit/UIKit.h>

#import "FlickrTableViewController.h"
#import "FlickrPhotosDataSource.h"
#import "ImageViewController.h"


NS_ASSUME_NONNULL_BEGIN

@interface FlickrPhotoTableViewController : FlickrTableViewController

// Prepare image view controller for segue, both in iPhone and iPad
- (void)prepareImageViewController:(ImageViewController *)imageViewController
                      forIndexPath:(NSIndexPath *)indexPath;

// FlickrPhotosDataSource object to hold photos presented in the photo view controller.
@property (strong, nonatomic) FlickrPhotosDataSource *photoDataSource;

@end

NS_ASSUME_NONNULL_END