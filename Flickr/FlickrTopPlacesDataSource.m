// Copyright (c) 2015 ;. All rights reserved.
// Created by Barak Yoresh.

#import "FlickrTopPlacesDataSource.h"

#import "FlickrFetcher.h"
#import "FlickrURLFetcher.h"
#import "FlickrLocationRenderer.h"

NS_ASSUME_NONNULL_BEGIN

@interface FlickrTopPlacesDataSource()

@property (strong, nonatomic) NSMutableDictionary *flickrPlacesByCountryDict;

@end

@implementation FlickrTopPlacesDataSource

#pragma mark - FlickrDataSource

- (void)loadData:(void (^)(NSError *error))completion {
  [FlickrURLFetcher fetchObjectType:[NSDictionary class]
                        fromURL:[FlickrFetcher URLforTopPlaces]
                     completion:^(id object, NSError * error) {
    if (error) {
      completion(error);
      return;
    }
                       
    NSDictionary *flickrPlacesDict = object;
    
    NSArray *places = [flickrPlacesDict mutableArrayValueForKeyPath:FLICKR_RESULTS_PLACES];
    
    [self addAllPlacesByCountry:places];
    
    [self sortPlacesAlphabetically];
    
    completion(error);
  }];
}

- (void) addAllPlacesByCountry:(NSArray *)places {
  self.flickrPlacesByCountryDict = [[NSMutableDictionary alloc] init];
  
  for (NSDictionary *place in places) {
    NSString *country =
        [FlickrLocationRenderer extractCountryFromPlace:[place valueForKeyPath:FLICKR_PLACE_NAME]];
    
    if (!self.flickrPlacesByCountryDict[country]) {
      self.flickrPlacesByCountryDict[country] = [[NSMutableArray alloc] init];
    }
    
    [self.flickrPlacesByCountryDict[country] addObject:place];
  }
}

- (void) sortPlacesAlphabetically {
  for (id key in [self.flickrPlacesByCountryDict copy]) {
    self.flickrPlacesByCountryDict[key] =
    [self.flickrPlacesByCountryDict[key] sortedArrayUsingComparator:^NSComparisonResult(id obj1,
                                                                                        id obj2) {
      if ([obj1 isKindOfClass:[NSDictionary class]] && [obj2 isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict1 = (NSDictionary *) obj1;
        NSDictionary *dict2 = (NSDictionary *) obj2;
        NSString *str1 = [dict1 valueForKeyPath:FLICKR_PLACE_NAME];
        NSString *str2 = [dict2 valueForKeyPath:FLICKR_PLACE_NAME];
        return [str1 compare:str2];
      } else {
        return NSOrderedSame;
      }
    }];
  }
}

- (id)cellPlaceIDForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSDictionary *location = [self locationForRowAtIndexPath:indexPath];
  return [location valueForKeyPath:FLICKR_PLACE_ID];
}

- (NSInteger)numberOfSections {
  return [self.flickrPlacesByCountryDict count];
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
  return [self.flickrPlacesByCountryDict[[self.flickrPlacesByCountryDict allKeys][section]] count];
}

- (NSString *)cellTitleForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSDictionary *location = [self locationForRowAtIndexPath:indexPath];
  NSString *placeString = [location valueForKeyPath:FLICKR_PLACE_NAME];
  return [FlickrLocationRenderer extractSpecificLocationFromPlace:placeString];
}

- (NSString *)cellSubTitleForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSDictionary *location = [self locationForRowAtIndexPath:indexPath];
  NSString *placeString = [location valueForKeyPath:FLICKR_PLACE_NAME];
  return [FlickrLocationRenderer extractLocationFromPlace:placeString];
}

- (NSDictionary *)locationForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSArray *flickrCountryKeys = [self.flickrPlacesByCountryDict allKeys];
  NSUInteger countryIndex = [indexPath indexAtPosition:0];
  NSUInteger locationIndex = [indexPath indexAtPosition:1];

  NSArray *locationsAtCountry = self.flickrPlacesByCountryDict[flickrCountryKeys[countryIndex]];
  return locationsAtCountry[locationIndex];
}

- (NSString *)titleForHeaderInSection:(NSUInteger)section {
  return [self.flickrPlacesByCountryDict allKeys][section];
}


@end

NS_ASSUME_NONNULL_END