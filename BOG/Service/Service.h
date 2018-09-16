//
//  Service.h
//  SchengenApp
//
//  Created by Nika Chkadua on 6/13/17.
//  Copyright © 2017 mobility. All rights reserved.
//

#import "AFNetworking.h"

@interface Service : NSObject

+ (instancetype)sharedInstance;

- (void)getContactInfoWithSuccessBlock:(void(^)(id responseObject))success andFailureBlock:(void(^)(NSError *error))failure;
- (void)getTermsAndConditionsWithSuccessBlock:(void(^)(id responseObject))success andFailureBlock:(void(^)(NSError *error))failure;
- (void)getTravelRulesWithSuccessBlock:(void(^)(id responseObject))success andFailureBlock:(void(^)(NSError *error))failure;
- (void)getFAQListWithSuccessBlock:(void(^)(id responseObject))success andFailureBlock:(void(^)(NSError *error))failure;
- (void)getUsageRulesWithSuccessBlock:(void(^)(id responseObject))success andFailureBlock:(void(^)(NSError *error))failure;
- (void)getCountryListWithSuccessBlock:(void(^)(id responseObject))success andFailureBlock:(void(^)(NSError *error))failure;
- (void)getShareLinkWithSuccessBlock:(void(^)(id responseObject))success andFailureBlock:(void(^)(NSError *error))failure;

@end
