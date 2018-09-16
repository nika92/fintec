//
//  GlobalUtils.m
//  Megzuri
//
//  Created by Nika Chkadua on 10/19/17.
//  Copyright © 2017 Mobility. All rights reserved.
//

#import "GlobalUtils.h"
#import "StyleUtils.h"
#import "HMLocalization.h"
#import "Constants.h"

@implementation GlobalUtils

+ (BOOL)isIpad {
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        return YES;
    
    return NO;
}

+ (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message inController:(UIViewController *)vc withActionBlock:(void(^)(BOOL buttonPressed))buttonPressBlock {
    
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:title
                                 message:message
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:[[HMLocalization sharedInstance] localizedStringForKey:ALERT_CLOSE] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        buttonPressBlock(YES);
        
    }]];
    [vc presentViewController:alert animated:YES completion:nil];
}

+ (void) disableUserInteractionToViewController:(UIViewController*)vc {
    
    for (int i = 0; i < vc.view.subviews.count; i++) {
        [vc.view.subviews[i] setUserInteractionEnabled:NO];
    }
    
    if (vc.navigationController.navigationItem.backBarButtonItem) {
        vc.navigationController.navigationItem.backBarButtonItem.enabled = NO;
    }
}

+ (void) enableUserInteractionToViewController:(UIViewController*)vc {
    
    for (int i = 0; i < vc.view.subviews.count; i++) {
        [vc.view.subviews[i] setUserInteractionEnabled:YES];
    }
    
    if (vc.navigationController.navigationItem.backBarButtonItem) {
        vc.navigationController.navigationItem.backBarButtonItem.enabled = YES;
    }
}

+ (void)imageFromUrl:(NSString *)url imageBlock:(void(^)(UIImage *image))image {
    
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:url]];
        if ( data == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            
            image([UIImage imageWithData:data]);
        });
    });
}

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)image:(UIImage*)originalImage scaledToSize:(CGSize)size {
    //avoid redundant drawing
    if (CGSizeEqualToSize(originalImage.size, size))
    {
        return originalImage;
    }
    
    //create drawing context
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    
    //draw
    [originalImage drawInRect:CGRectMake(0.0f, 0.0f, size.width, size.height)];
    
    //capture resultant image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //return image
    return image;
}

+ (NSString *)getStringFromDate:(NSDate *)date withFormat:(NSString *)dateFormat {
    
    NSDateFormatter* df = [[NSDateFormatter alloc]init];
    [df setDateFormat:dateFormat];
    NSString *result = [df stringFromDate:date];
    
    return result;
}

+ (void)getStringFromHtml:(NSString *)htmlString successBlock:(void(^)(NSAttributedString *string))string andErrorBlock:(void(^)(NSError *error))errorBlock {
    
    NSError *error = nil;
    
    NSAttributedString *attString = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUTF8StringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute:@(NSUTF8StringEncoding)} documentAttributes:nil error:&error];
    
    NSMutableAttributedString *newString = [[NSMutableAttributedString alloc] initWithAttributedString:attString];
    NSRange range = (NSRange){0,[newString length]};
    [newString enumerateAttribute:NSFontAttributeName inRange:range options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired usingBlock:^(id value, NSRange range, BOOL *stop) {
        UIFont *replacementFont = [StyleUtils dejaVuSansLightWithSize:12];
        [newString addAttribute:NSFontAttributeName value:replacementFont range:range];
    }];
    
    if (error) {
        NSLog(@"Error: %@ %s %i", error.localizedDescription, __func__, __LINE__);
        errorBlock(error);
    } else {
        string(newString);
    }
}

const struct DateFormat DateFormat = {
    
    .YEAR_MONTH_DAY         = @"yyyy-MM-dd",
    .YEAR_MONTH_DAY_TIME    = @"yyyy-MM-dd HH:mm",
};
@end
