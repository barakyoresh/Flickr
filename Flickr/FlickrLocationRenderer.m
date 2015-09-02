// Copyright (c) 2015 Lightricks. All rights reserved.
// Created by Barak Yoresh.

#import "FlickrLocationRenderer.h"

NS_ASSUME_NONNULL_BEGIN

#pragma mark - NSString Category Methods

@interface NSString (FlickrLocationRenderer)

- (NSString *)substringBeforeLast:(BOOL)last delimeter:(NSString *)delimeter;

- (NSString *)substringAfterLast:(BOOL)last delimeter:(NSString *)delimeter;

@end

@implementation NSString (FlickrLocationRenderer)

- (NSString *)substringBeforeLast:(BOOL)last delimeter:(NSString *)delimeter {
  NSRange range = [self rangeOfString:delimeter
                               options:(last ? NSBackwardsSearch : 0)];
  if (range.location == NSNotFound) {
    return self;
  }
  
  return [self substringToIndex:range.location];
}

- (NSString *)substringAfterLast:(BOOL)last delimeter:(NSString *)delimeter {
  NSRange range = [self rangeOfString:delimeter
                               options:(last ? NSBackwardsSearch : 0)];
  if (range.location == NSNotFound) {
    return self;
  }
  
  return [self substringFromIndex:range.location + [delimeter length]];
}

@end

#pragma mark - FlickrLocationRenderer

#define LOCATION_DELIMETER ", "

@implementation FlickrLocationRenderer

+ (NSString *)extractCountryFromPlace:(NSString *)placeString {
  return [placeString substringAfterLast:YES
                               delimeter:@LOCATION_DELIMETER];
}

+ (NSString *)extractSpecificLocationFromPlace:(NSString *)placeString {
  return [placeString substringBeforeLast:NO
                                delimeter:@LOCATION_DELIMETER];
}

+ (NSString *)extractLocationFromPlace:(NSString *)placeString {
  return [[placeString substringBeforeLast:YES
                                 delimeter:@LOCATION_DELIMETER]
              substringAfterLast:NO
                       delimeter:@LOCATION_DELIMETER];
}



@end

NS_ASSUME_NONNULL_END
