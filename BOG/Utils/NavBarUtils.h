//
//  NavBarUtils.h
//  Megzuri
//
//  Created by Nika Chkadua on 10/19/17.
//  Copyright © 2017 Mobility. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NavBarUtils : NSObject

+ (void)setNavBarTitleColor:(NSString *)title
               inController:(UIViewController *)controller;
+ (void)addTitle:(NSString *)title inController:(UIViewController *)controller;
+ (void)addLogoInController:(UIViewController *)vc;

@end
