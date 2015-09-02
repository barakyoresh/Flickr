// Copyright (c) 2015 Lightricks. All rights reserved.
// Created by Barak Yoresh.

#import "FlickrPhotoTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@implementation FlickrPhotoTableViewController

- (FlickrDataSource *) getDataSource {
  return _photoDataSource;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if([[segue identifier] isEqualToString:@"Show Photo"]) {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    if (indexPath) {
      if ([segue.destinationViewController isKindOfClass:[ImageViewController class]]) {
        [self prepareImageViewController:segue.destinationViewController forIndexPath:indexPath];
      }
    }
  }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  id detail = [self.splitViewController.viewControllers objectAtIndex:1];
  if ([detail isKindOfClass:[UINavigationController class]]) {
    detail = [((UINavigationController *) detail).viewControllers firstObject];
  }
  if ([detail isKindOfClass:[ImageViewController class]]) {
    
    [self prepareImageViewController:detail forIndexPath:indexPath];
  }
}

- (void)prepareImageViewController:(ImageViewController *)imageViewController
                      forIndexPath:(NSIndexPath *)indexPath {
  FlickrPhotosDataSource *imageDataSource = (FlickrPhotosDataSource *) self.dataSource;
  imageViewController.imageURL =
      [imageDataSource cellImageURLForRowAtIndexPath:indexPath];
  imageViewController.title =
      [imageDataSource cellTitleForRowAtIndexPath:indexPath];
}


@end

NS_ASSUME_NONNULL_END