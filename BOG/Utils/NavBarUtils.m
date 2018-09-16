//
//  NavBarUtils.m
//  Megzuri
//
//  Created by Nika Chkadua on 10/19/17.
//  Copyright © 2017 Mobility. All rights reserved.
//

#import "StyleUtils.h"
#import "NavBarUtils.h"
#import <UIKit/UIKit.h>
#import "StyleUtils.h"

@implementation NavBarUtils

+ (void)addLogoInController:(UIViewController *)vc {
    
    UIImage *img = [UIImage imageNamed:@"optima_menu_logo.png"];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [imgView setImage:img];
    
    [imgView setContentMode:UIViewContentModeScaleAspectFit];
    vc.navigationItem.titleView = imgView;
}

+ (void) addTitle:(NSString *)title inController:(UIViewController *)controller {
    [self setNavBarTitleColor:title inController:controller];
}

+ (void) setNavBarTitleColor:(NSString *)title inController:(UIViewController *)controller {
    
    if (title == nil) title = @"";
        
        UILabel *label          = [[UILabel alloc] initWithFrame:CGRectZero];
        label.backgroundColor   = [UIColor clearColor];
        label.textColor         = [UIColor whiteColor];
        label.numberOfLines     = 0;
        
        NSMutableAttributedString * string = [[NSMutableAttributedString alloc] initWithString:title];
        
        NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
        [paragrahStyle setLineSpacing:6];
    [paragrahStyle setAlignment:NSTextAlignmentCenter];
    [string addAttribute:NSParagraphStyleAttributeName value:paragrahStyle range:NSMakeRange(0, [string length])];
    [string setAttributes: @{NSForegroundColorAttributeName:[UIColor whiteColor],
                             NSFontAttributeName:[StyleUtils dejaVuSansMTBoldWithSize:17]} range:NSMakeRange(0, [string length])];
    
    label.attributedText = string;
    [label sizeToFit];
    
    controller.navigationItem.titleView = label;
}

@end
