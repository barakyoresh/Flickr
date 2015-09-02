// Copyright (c) 2015 Lightricks. All rights reserved.
// Created by Barak Yoresh.

#import "FlickrURLFetcher.h"

NS_ASSUME_NONNULL_BEGIN

@implementation FlickrURLFetcher

#define LOAD_OBJECT_QUEUE_NAME "fetch object"

+ (void)fetchObjectType:(Class)objectType
            fromURL:(NSURL *)URL
         completion:(void (^)(id object, NSError *error))completion {
  
  dispatch_queue_t loadDataQueue = dispatch_queue_create(LOAD_OBJECT_QUEUE_NAME, 0);
  dispatch_async(loadDataQueue, ^{
    NSError *error = nil;
    id object = nil;
    NSData *jsonResponse = [NSData dataWithContentsOfURL:URL
                                                 options:0
                                                   error:&error];
    if (error) {
      dispatch_async(dispatch_get_main_queue(), ^{ completion(object, error); });
      return;
    }
  
    
    object = [NSJSONSerialization JSONObjectWithData:jsonResponse
                                             options:0
                                               error:&error];
    if (error || ![object isKindOfClass:objectType]) {
      object = nil;
      dispatch_async(dispatch_get_main_queue(), ^{ completion(object, error); });
      return;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{ completion(object, error); });
  });
}
                

@end

NS_ASSUME_NONNULL_END
