
//  HttpClient.m
//  PSP
//
//  Created by Sergo Beruashvili on 10/7/14.
//  Copyright (c) 2014 Mobility LLC. All rights reserved.
//


#import "AppDelegate.h"
#import "HttpClient.h"
#import "AFNetworking.h"
#import "Constants.h"
#import "HMLocalization.h"
#import "GlobalUtils.h"

@interface HttpClient()

@end

@implementation HttpClient

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static HttpClient *instance;
    dispatch_once(&onceToken, ^{
        instance = [[HttpClient alloc] init];
    });
    return instance;
}

- (id)init {
    
    self = [super init];
    
    self.httpQueue = [[NSOperationQueue alloc] init];
    self.httpQueue.maxConcurrentOperationCount = 4;
    
    return self;
}

- (void) sendGetRequestToPath:(NSString *)path
               withParameters:(id)params
                       success:(void(^)(id responseObject))success
                       failure:(void(^)(NSError *errorDictionary))failure {
    
    NSString *activeLanguage = [[HMLocalization sharedInstance] getLanguage];
    
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@%@%@", API_BASE_URL, [GlobalUtils getLangueForRequestFromActiveLanguage:activeLanguage], @"/", path];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = nil;
    
    [manager GET: requestUrl parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if(success){
            success(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (failure){
            failure(error);
        }
    }];
}

- (void) sendPostRequestToPath:(NSString *)path
                withParameters:(id)params
                       success:(void(^)(id responseObject))success
                       failure:(void(^)(NSError *errorDictionary))failure
{
    
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@", API_BASE_URL, path];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = nil;
  
    [manager POST: requestUrl parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if(success){
            
            success(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (failure){
            failure(error);
        }
    }];
}

@end
