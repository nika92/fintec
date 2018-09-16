//
//  StyleUtils.m
//  Megzuri
//
//  Created by Nika Chkadua on 10/19/17.
//  Copyright © 2017 Mobility. All rights reserved.
//

#import "StyleUtils.h"
#import "GlobalUtils.h"

UIColor *colorRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha) {
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}

@implementation StyleUtils

+ (UIColor *)mainOrangeColor {
    return colorRGB(255, 194, 53, 1);
}

+ (UIColor *)grayColor {
    return colorRGB(109, 110, 113, 1);
}

+ (UIColor *)roadGreenColor {
    return colorRGB(127, 199, 74, 1);
}

+ (UIFont *)dejaVuSansMTBoldWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"BPGDejaVuSansMt-Bold" size:size];
}

+ (UIFont *)dejaVuSansLightWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"!BPG!DejaVuSansLight-ExtraLight" size:size];
}

+ (UIFont *)techCapsBlackWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"BPGTechCapsBlack" size:size];
}

+ (void)makeShadowToButton:(UIButton *)button {
    
    [button.layer setShadowOffset:CGSizeMake(0, 5)];
    [button.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [button.layer setShadowOpacity:0.5];
}

+ (void)makeBorderToButton:(UIButton *)button withColor:(UIColor *)color andCornerRadius:(int)radius {
    
    button.layer.borderColor = color.CGColor;
    button.layer.borderWidth = 1;
    button.layer.cornerRadius = radius;
}

+ (void)addStrokeToTextField:(UITextField *)field ofColor:(UIColor *)color {
    
    CALayer *bottomBorder           = [CALayer layer];
    bottomBorder.frame              = CGRectMake(0.0f, field.frame.size.height - 1, field.frame.size.width, 1.0f);
    bottomBorder.backgroundColor    = color.CGColor;
    
    [field.layer addSublayer:bottomBorder];
}

+ (void)changePlaceHolderColor:(UITextField *)textfield withColor:(UIColor *)color {
    
    if ([textfield respondsToSelector:@selector(setAttributedPlaceholder:)]) {
        textfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:textfield.placeholder attributes:@{NSForegroundColorAttributeName: color}];
    } else {
        
    }
}

@end
