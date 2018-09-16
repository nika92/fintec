//
//  LeftMenuHeaderCell.h
//  Megzuri
//
//  Created by Nika Chkadua on 10/20/17.
//  Copyright © 2017 Mobility. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftMenuHeaderCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *appNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLbl;

- (void)setUpCell;

@end
