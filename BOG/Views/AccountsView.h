//
//  AccountsView.h
//  Liberty Bank
//
//  Created by nikoloz on 06.07.16.
//  Copyright © 2016 Mobility. All rights reserved.
//


#import "Account.h"
#import <UIKit/UIKit.h>

@protocol AccountsViewDelegate <NSObject>

- (void) didClickCell:(Account *) object;

@end

@interface AccountsView : UIView

@property (weak,nonatomic) id<AccountsViewDelegate> delegate;

- (void) reloadViewWithArray:(NSArray *)array groupByIban:(BOOL)groupByIban;

@end
