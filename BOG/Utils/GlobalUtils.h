//
//  GlobalUtils.h
//  Megzuri
//
//  Created by Nika Chkadua on 10/19/17.
//  Copyright © 2017 Mobility. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GlobalUtils : NSObject

+ (BOOL)isIpad;

+ (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message inController:(UIViewController *)vc withActionBlock:(void(^)(BOOL buttonPressed))buttonPressBlock;

+ (void) disableUserInteractionToViewController:(UIViewController*)vc;
+ (void) enableUserInteractionToViewController:(UIViewController*)vc;

+ (void)imageFromUrl:(NSString *)url imageBlock:(void(^)(UIImage *image))image;
+ (UIImage *)image:(UIImage*)originalImage scaledToSize:(CGSize)size;
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;

+ (NSString *)getStringFromDate:(NSDate *)date withFormat:(NSString *)dateFormat;
+ (void)getStringFromHtml:(NSString *)htmlString successBlock:(void(^)(NSAttributedString *string))string andErrorBlock:(void(^)(NSError *error))errorBlock;

extern const struct DateFormat {
    
    __unsafe_unretained NSString *YEAR_MONTH_DAY;
    __unsafe_unretained NSString *YEAR_MONTH_DAY_TIME;
    
} DateFormat;

@end
