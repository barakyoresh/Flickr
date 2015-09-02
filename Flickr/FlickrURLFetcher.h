// Copyright (c) 2015 Lightricks. All rights reserved.
// Created by Barak Yoresh.

#include <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FlickrURLFetcher : NSObject

+ (void)fetchObjectType:(Class)objectType
            fromURL:(NSURL *)URL
         completion:(void (^)(id object, NSError *error))completion;

@end

NS_ASSUME_NONNULL_END
