//
//  HttpClient.h
//  PSP
//
//  Created by Sergo Beruashvili on 10/7/14.
//  Copyright (c) 2014 Mobility LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface HttpClient : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic) NSOperationQueue *httpQueue;

- (void) sendGetRequestToPath:(NSString *)path
               withParameters:(id)params
                      success:(void(^)(id responseObject))success
                      failure:(void(^)(NSError *error))failure;

- (void) sendPostRequestToPath:(NSString *)path
                withParameters:(id)params
                       success:(void(^)(id responseObject))success
                       failure:(void(^)(NSError *error))failure;

@end
