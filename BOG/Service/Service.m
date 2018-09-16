//
//  Service.m
//  SchengenApp
//
//  Created by Nika Chkadua on 6/13/17.
//  Copyright © 2017 mobility. All rights reserved.
//

#import "Service.h"
#import "HttpClient.h"

@implementation Service

+ (instancetype)sharedInstance {
    
    static dispatch_once_t onceToken;
    static Service *instance;
    dispatch_once(&onceToken, ^{
        instance = [[Service alloc] init];
    });
    return instance;
}

- (void)getContactInfoWithSuccessBlock:(void(^)(id responseObject))success andFailureBlock:(void(^)(NSError *error))failure {
    
//    NSString *path = [NSString stringWithFormat:@"card/getcardsfor/%@", accountID];
    
    NSString *path = @"api/contact";
    
    [[HttpClient sharedInstance] sendGetRequestToPath:path withParameters:nil success:^(id responseObject) {
        
        success(responseObject);
        
    }failure:^(NSError *error) {
        
        failure(error);
    }];
}

- (void)getTravelRulesWithSuccessBlock:(void(^)(id responseObject))success andFailureBlock:(void(^)(NSError *error))failure {
    
    NSString *path = @"api/travel-rules";
    
    [[HttpClient sharedInstance] sendGetRequestToPath:path withParameters:nil success:^(id responseObject) {
        
        success(responseObject);
        
    }failure:^(NSError *error) {
        
        failure(error);
    }];
}

- (void)getTermsAndConditionsWithSuccessBlock:(void(^)(id responseObject))success andFailureBlock:(void(^)(NSError *error))failure {
    
    NSString *path = @"api/terms-conditions";
    
    [[HttpClient sharedInstance] sendGetRequestToPath:path withParameters:nil success:^(id responseObject) {
        
        success(responseObject);
        
    }failure:^(NSError *error) {
        
        failure(error);
    }];
}

- (void)getFAQListWithSuccessBlock:(void(^)(id responseObject))success andFailureBlock:(void(^)(NSError *error))failure {
    
    NSString *path = @"api/faq";
    
    [[HttpClient sharedInstance] sendGetRequestToPath:path withParameters:nil success:^(id responseObject) {
        
        success(responseObject);
        
    }failure:^(NSError *error) {
        
        failure(error);
    }];
}

- (void)getUsageRulesWithSuccessBlock:(void(^)(id responseObject))success andFailureBlock:(void(^)(NSError *error))failure {
    
    NSString *path = @"api/usage-rules";
    
    [[HttpClient sharedInstance] sendGetRequestToPath:path withParameters:nil success:^(id responseObject) {
        
        success(responseObject);
        
    }failure:^(NSError *error) {
        
        failure(error);
    }];
}

- (void)getCountryListWithSuccessBlock:(void(^)(id responseObject))success andFailureBlock:(void(^)(NSError *error))failure {
    
    NSString *path = @"api/country-list";
    
    [[HttpClient sharedInstance] sendGetRequestToPath:path withParameters:nil success:^(id responseObject) {
        
        success(responseObject);
        
    }failure:^(NSError *error) {
        
        failure(error);
    }];
}

- (void)getShareLinkWithSuccessBlock:(void(^)(id responseObject))success andFailureBlock:(void(^)(NSError *error))failure {
    
    NSString *path = @"api/link-ios";
    
    [[HttpClient sharedInstance] sendGetRequestToPath:path withParameters:nil success:^(id responseObject) {
        
        success(responseObject);
        
    }failure:^(NSError *error) {
        
        failure(error);
    }];
}

@end
