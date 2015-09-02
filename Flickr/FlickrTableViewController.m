// Copyright (c) 2015 Lightricks. All rights reserved.
// Created by Barak Yoresh.

#import "FlickrTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@implementation FlickrTableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self loadData];
}

- (IBAction)loadData {
  [self.refreshControl beginRefreshing];
  [self.dataSource loadData:^(NSError *error) {
    if (!error) {
      [self.tableView reloadData];
      [self.refreshControl endRefreshing];
    }
  }];
}

#pragma mark - parameters

- (FlickrDataSource *) dataSource {
  if (!_dataSource) {
    _dataSource = [self getDataSource];
  }
  return _dataSource;
}

#pragma mark - UITableViewDataSource

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  NSString *headerTitle = [self.dataSource titleForHeaderInSection:section];
  return headerTitle;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return [self.dataSource numberOfSectionsInDataSource];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.dataSource numberOfRowsInSection:section];
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Flickr Table Cell"
                                                          forIndexPath:indexPath];
  
  cell.textLabel.text = [self.dataSource cellTitleForRowAtIndexPath:indexPath];
  cell.detailTextLabel.text = [self.dataSource cellSubTitleForRowAtIndexPath:indexPath];
  
  return cell;
}

#pragma - mark abstract

- (FlickrDataSource *)getDataSource {
  assert(NO);
  return nil;
}


@end

NS_ASSUME_NONNULL_END
