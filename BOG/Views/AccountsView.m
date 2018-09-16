//
//  AccountsView.m
//  Liberty Bank
//
//  Created by nikoloz on 06.07.16.
//  Copyright © 2016 Mobility. All rights reserved.
//

#import "AccountsProvider.h"
#import <UIKit/UIKit.h>
#import "AccountsView.h"
#import "AccountCell.h"
#import "Constants.h"

@interface AccountsView() <UITableViewDelegate, UITableViewDataSource> {
    
    NSArray *arrayForTableView;
    BOOL isGroupedByIban;
}

@property (weak, nonatomic) IBOutlet UITableView *accountsTableView;

@end


@implementation AccountsView

- (void) awakeFromNib {
    
    [super awakeFromNib];
    
    self.accountsTableView.delegate = self;
    self.accountsTableView.dataSource = self;
    
    [self.accountsTableView registerNib:[UINib nibWithNibName:@"AccountCell" bundle:nil] forCellReuseIdentifier:@"AccountCell"];
    
    arrayForTableView = [[AccountsProvider sharedInstance] accountsArray];
}

- (void) reloadViewWithArray:(NSArray *)array groupByIban:(BOOL)groupByIban{
    
    isGroupedByIban = groupByIban;
    
    arrayForTableView = array;
    [self.accountsTableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AccountCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AccountCell"];;
    
    if (isGroupedByIban) {
        
        Account *acc = (Account*)[[arrayForTableView objectAtIndex:indexPath.row] objectForKey:@"iban"][0];
        
        [cell setCellUp:acc];
        
    } else {
        [cell setCellUp:[arrayForTableView objectAtIndex:indexPath.row]];
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [arrayForTableView count];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 68;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (isGroupedByIban) {
        
        Account *acc = (Account*)[[arrayForTableView objectAtIndex:indexPath.row] objectForKey:@"iban"][0];
        
        [self.delegate didClickCell:acc];
        
    } else {
        [self.delegate didClickCell:[arrayForTableView objectAtIndex:indexPath.row]];
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code

    self.layer.cornerRadius = 4;

}


@end
