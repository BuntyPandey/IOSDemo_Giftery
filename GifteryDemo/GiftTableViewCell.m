//
//  GiftTableViewCell.m
//  GifteryDemo
//
//  Created by Amit Pandey on 13/06/17.
//  Copyright © 2017 Amit Pandey. All rights reserved.
//

#import "GiftTableViewCell.h"
#import "Utitlity.h"
#import "Constant.h"

@implementation GiftTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

//This method will set value of Table Cell outlets from Gift Object
- (void)configureCellData:(Gift *)giftObj {
    self.lblOccasion.text = giftObj.strOccasion;
    self.lblPersonName.text = giftObj.strName;
    self.lblDate.text = giftObj.strOccasionformattedDate;
    if ([giftObj.isGifted isEqualToString:@"TRUE"]) {
        [self.giftStatusButton setBackgroundImage:[UIImage imageNamed:@"icon5"] forState:UIControlStateNormal];
        [self.giftStatusButton setTitle:@"" forState:UIControlStateNormal];
        [self.giftStatusButton setContentMode:UIViewContentModeCenter];
    }
    else {
        [self.giftStatusButton setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [self.giftStatusButton setTitle:@"GIFT" forState:UIControlStateNormal];
    }
    //Get difference between two dates from Utility
    self.lblDate_remaining.text = [NSString stringWithFormat:@"In %@",giftObj.strOccasionPublishDate];
    //Set Label font
    self.lblPersonName.font = FONT_MAIN_TITLE;
    self.lblDate.font = FONT_MAIN_TITLE;
    self.lblOccasion.font = FONT_SUB_TITLE;
    self.lblDate_remaining.font = FONT_SUB_TITLE;
    
}


@end
