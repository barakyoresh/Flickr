// Copyright (c) 2015 Lightricks. All rights reserved.
// Created by Barak Yoresh.

#import "FlickrPhotosByPlaceDataSource.h"

#import "FlickrURLFetcher.h"
#import "FlickrFetcher.h"

NS_ASSUME_NONNULL_BEGIN

@implementation FlickrPhotosByPlaceDataSource

#define MAX_RESULTS_TO_SHOW 50

- (void)loadData:(void (^)(NSError *))completion {
  [FlickrURLFetcher fetchObjectType:[NSDictionary class]
                        fromURL:[FlickrFetcher URLforPhotosInPlace:self.flickrPlaceID
                                                        maxResults:MAX_RESULTS_TO_SHOW]
                     completion:^(id object, NSError * error) {
                       if (error) {
                         completion(error);
                         return;
                       }
                       NSDictionary *flickrPhotosDict = object;
                       self.flickrPhotos = [flickrPhotosDict mutableArrayValueForKeyPath:FLICKR_RESULTS_PHOTOS];
                       completion(error);
                     }];
}

@end

NS_ASSUME_NONNULL_END
