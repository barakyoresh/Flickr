// Copyright (c) 2015 Lightricks. All rights reserved.
// Created by Barak Yoresh.

#import "FlickrTopPlacesTableViewController.h"

#import "FlickrPhotoByPlaceTableViewController.h"
#import "FlickrTopPlacesDataSource.h"

NS_ASSUME_NONNULL_BEGIN

@implementation FlickrTopPlacesTableViewController

- (FlickrDataSource *) getDataSource {
  return [[FlickrTopPlacesDataSource alloc] init];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if([[segue identifier] isEqualToString:@"Show Location Photos"]) {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    if (indexPath) {
      
      FlickrPhotoByPlaceTableViewController *photoTableViewController =
          (FlickrPhotoByPlaceTableViewController *)segue.destinationViewController;
      photoTableViewController.title =
          [((FlickrTopPlacesDataSource *)self.dataSource) cellTitleForRowAtIndexPath:indexPath];
      photoTableViewController.flickrPlaceID =
      [((FlickrTopPlacesDataSource *)self.dataSource) cellPlaceIDForRowAtIndexPath:indexPath];
    }
  }
}

@end
NS_ASSUME_NONNULL_END
