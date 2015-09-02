// Copyright (c) 2015 Lightricks. All rights reserved.
// Created by Barak Yoresh.

#import "FlickrPhotoCacheManager.h"


NS_ASSUME_NONNULL_BEGIN

@implementation FlickrPhotoCacheManager

+ (void)addPhoto:(NSDictionary *)photo ForKey:(NSString *)key {
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  NSArray *photosForKey = [userDefaults arrayForKey:key];
  
  if (![FlickrPhotoCacheManager array:photosForKey containsPhoto:photo]) {
    NSMutableArray *newPhotosForKey = [[NSMutableArray alloc] init];
    [newPhotosForKey addObject:photo];
    [newPhotosForKey addObjectsFromArray:photosForKey];
    [userDefaults setObject:newPhotosForKey forKey:key];
    [userDefaults synchronize];
  }
}

+ (NSArray *)getPhotosForKey:(NSString *)key {
  return [[NSUserDefaults standardUserDefaults] arrayForKey:key];
}

+ (BOOL) array:(NSArray *)array containsPhoto:(NSDictionary *)photo{
  __block BOOL found = NO;
  [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    if ([obj isKindOfClass:[NSDictionary class]]) {
      if ([obj isEqualToDictionary:photo]) {
        found = YES;
        *stop = YES;
      }
    }
  }];
  return found;
}


@end

NS_ASSUME_NONNULL_END
