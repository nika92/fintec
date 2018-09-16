//
//  CustNavC.m
//  Megzuri
//
//  Created by Nika Chkadua on 10/19/17.
//  Copyright © 2017 Mobility. All rights reserved.
//

#import "CustNavC.h"
#import "UIViewController+LGSideMenuController.h"

@interface CustNavC ()

@end

@implementation CustNavC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.sideMenuController.leftViewAlwaysVisibleOptions = LGSideMenuAlwaysVisibleOnPadLandscape;
}

@end
