//
//  CustomTabBarVC.m
//  MyMaps
//
//  Created by nikoloz on 10.12.15.
//  Copyright © 2015 mobility. All rights reserved.
//

#import "CustomTabBarVC.h"
#import "StyleUtils.h"
#import "GlobalUtils.h"
#import "HMLocalization.h"
#import "OtherConstants.h"
#import "TabBarItemConstants.h"
#import "GlobalUtils.h"

#define _RGB(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@interface CustomTabBarVC() <UITabBarControllerDelegate> {
    UIViewController *lastSelectedVC;
}

@property (strong,nonatomic) NSArray *selectedImagesArray;
@property (strong,nonatomic) NSArray *imagesArray;
@property (strong,nonatomic) NSArray *titlesArray;

@end

@implementation CustomTabBarVC

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    self.selectedIndex = 0;
    [self setTabProperties];
    
    self.delegate = self;
    
    [self.tabBar setBackgroundColor:[StyleUtils appMainColor]];
    [self.tabBar setTintColor:[UIColor whiteColor]];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(setTabProperties)
                                                 name:LANGUAGE_CHANGE_NOTIFICATION
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(logOut)
                                                 name:@"logOut"
                                               object:nil];
}

- (void)logOut {
    
    NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie *each in cookieStorage.cookies) {
        [cookieStorage deleteCookie:each];
    }
    
    [self performSegueWithIdentifier:@"logOut" sender:nil];
}

- (void) setTabProperties
{
    
    [self.tabBar setBackgroundImage:[GlobalUtils imageWithImage:[UIImage imageNamed:@"tab_background"] scaledToSize:CGSizeMake(self.tabBar.frame.size.width, self.tabBar.frame.size.height)]];
    
    NSString *homeBtnTitle          = [[HMLocalization sharedInstance] localizedStringForKey:TAB_BAR_CONST_HOME];
    NSString *currencyBtnTitle      = [[HMLocalization sharedInstance] localizedStringForKey:TAB_BAR_CONST_CURRENCY];
    NSString *mobileBtnTitle        = [[HMLocalization sharedInstance] localizedStringForKey:TAB_BAR_CONST_TOP_UP_MOBILE];
    NSString *transactionsBtnTitle  = [[HMLocalization sharedInstance] localizedStringForKey:TAB_BAR_CONST_TRANSACTIONS];
    NSString *billsBtnTitle     = [[HMLocalization sharedInstance] localizedStringForKey:TAB_BAR_CONST_BILLS];
    
    self.imagesArray = [[NSArray alloc] initWithObjects: @"tab-home",@"tab-currency",@"tab-mobtopup",@"tab-transfer",@"tab-bill",nil];
    self.titlesArray = [[NSArray alloc] initWithObjects:homeBtnTitle, currencyBtnTitle, mobileBtnTitle, transactionsBtnTitle, billsBtnTitle, nil];
    self.selectedImagesArray = [[NSArray alloc] initWithObjects: @"tab-home",@"tab-currency",@"tab-mobtopup",@"tab-transfer",@"tab-bill",nil];
    
         NSUInteger count = 0;
    for (UITabBarItem *item in self.tabBar.items) {
        
        
        UIImage *mImage = [GlobalUtils imageWithImage:[UIImage imageNamed:[self.imagesArray objectAtIndex:count]] scaledToSize: CGSizeMake(25, 25)];
        [item setImage:[mImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [item setTitle:[self.titlesArray objectAtIndex:count]];
        
        NSDictionary *attributes = @{
                                     NSForegroundColorAttributeName: [UIColor whiteColor],
                                     NSFontAttributeName: [UIFont fontWithName:@"BPGDejaVuSans" size:8.0]
                                     };
        
        [item setTitleTextAttributes:attributes
                            forState:UIControlStateNormal];
        [item setTitleTextAttributes:attributes
                            forState:UIControlStateSelected];
        
        
        count ++;
    }
    
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    [(UINavigationController *)viewController popToRootViewControllerAnimated:YES];
}

@end
