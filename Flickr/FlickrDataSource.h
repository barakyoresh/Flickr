// Copyright (c) 2015 Lightricks. All rights reserved.
// Created by Barak Yoresh.

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FlickrDataSource : NSObject

// default value 1
- (NSInteger)numberOfSections;

// default value nil
- (NSString *)titleForHeaderInSection:(NSUInteger)section;

#pragma mark - abstract

- (NSString *)cellTitleForRowAtIndexPath:(NSIndexPath *)indexPath;

- (NSString *)cellSubTitleForRowAtIndexPath:(NSIndexPath *)indexPath;

- (NSInteger)numberOfRowsInSection:(NSInteger)section;

// Called by view controller whenever data update is required, completion will be called when data
// fetching finished.
- (void)loadData:(void (^)(NSError *error))completion;
//TODO: (Daniel) explain to Barak - how do I make the block's return value nullable? the macro doesn't seem to work here.

@end

NS_ASSUME_NONNULL_END
