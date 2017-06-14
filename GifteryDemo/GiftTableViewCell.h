//
//  GiftTableViewCell.h
//  GifteryDemo
//
//  Created by Amit Pandey on 13/06/17.
//  Copyright © 2017 Amit Pandey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Gift.h"

@interface GiftTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblPersonName;
@property (weak, nonatomic) IBOutlet UILabel *lblOccasion;
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UILabel *lblDate_remaining;
@property (weak, nonatomic) IBOutlet UIButton *giftStatusButton;
- (void)configureCellData:(Gift *)user;

@end
