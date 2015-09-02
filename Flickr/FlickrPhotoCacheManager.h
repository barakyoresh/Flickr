// Copyright (c) 2015 Lightricks. All rights reserved.
// Created by Barak Yoresh.

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FlickrPhotoCacheManager : NSObject

// Add photo (if not already present) in an ordered list of under given key.
+ (void)addPhoto:(NSDictionary *)photo ForKey:(NSString *)key;

// Return ordered photo dictionary array for given key.
+ (NSArray *)getPhotosForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
