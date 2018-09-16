//
//  LeftMenuHeaderCell.m
//  Megzuri
//
//  Created by Nika Chkadua on 10/20/17.
//  Copyright © 2017 Mobility. All rights reserved.
//

#import "LeftMenuHeaderCell.h"
#import "HMLocalization.h"
#import "Constants.h"

@implementation LeftMenuHeaderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setUpCell {
    
    _appNameLbl.text  = [[[HMLocalization sharedInstance] localizedStringForKey:MEGZURI_TITLE] uppercaseString];
    _subTitleLbl.text = [[HMLocalization sharedInstance] localizedStringForKey:MEGZURI_SUBTITLE];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
