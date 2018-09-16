//
//  StyleUtils.h
//  Megzuri
//
//  Created by Nika Chkadua on 10/19/17.
//  Copyright © 2017 Mobility. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

UIColor *colorRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha);

typedef enum ImageAligmentToButton {
    left = 0,
    right,
} imageAligmentToButton;

@interface StyleUtils : NSObject

+ (UIColor *)mainOrangeColor;
+ (UIColor *)grayColor;
+ (UIColor *)roadGreenColor;

+ (UIFont *)dejaVuSansMTBoldWithSize:(CGFloat)size;
+ (UIFont *)dejaVuSansLightWithSize:(CGFloat)size;
+ (UIFont *)techCapsBlackWithSize:(CGFloat)size;

+ (void)makeShadowToButton:(UIButton *)button;
+ (void)makeBorderToButton:(UIButton *)button withColor:(UIColor *)color andCornerRadius:(int)radius;
+ (void)addStrokeToTextField:(UITextField *)field ofColor:(UIColor *)color;
+ (void)changePlaceHolderColor:(UITextField *)textfield withColor:(UIColor *)color;

@end
