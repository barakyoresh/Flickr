// Copyright (c) 2015 Lightricks. All rights reserved.
// Created by Barak Yoresh.

#import <UIKit/UIKit.h>

#import "FlickrDataSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface FlickrTableViewController : UITableViewController

// FlickrDataSource object to supply data for this table view.
@property (strong, nonatomic) FlickrDataSource *dataSource;

#pragma mark - abstract
// Abstract method to override and supply a data srouce.
- (FlickrDataSource *)getDataSource;

@end

NS_ASSUME_NONNULL_END
