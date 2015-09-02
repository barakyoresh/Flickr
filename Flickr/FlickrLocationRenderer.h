// Copyright (c) 2015 Lightricks. All rights reserved.
// Created by Barak Yoresh.

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// Flicker locations are made in the from <l_1>, <l_2>, ... ,<l_n> where each location is more
// specefic than the one the follows it.
@interface FlickrLocationRenderer : NSObject

// Extracts the least specific place in the location.
+ (NSString *)extractCountryFromPlace:(NSString *)placeString;

// Extracts the most specific place in the location.
+ (NSString *)extractSpecificLocationFromPlace:(NSString *)placeString;

// Extracts the location data between the most and least specific locations.
+ (NSString *)extractLocationFromPlace:(NSString *)placeString;

@end

NS_ASSUME_NONNULL_END
