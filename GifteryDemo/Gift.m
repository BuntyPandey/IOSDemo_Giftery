//
//  Gift.m
//  GifteryDemo
//
//  Created by Amit Pandey on 13/06/17.
//  Copyright © 2017 Amit Pandey. All rights reserved.
//

#import "Gift.h"
#import "Utitlity.h"
@implementation Gift

-(id)initWithData:(NSDictionary *)data
{
    if(self = [super init]) {
        self.strName = [data objectForKey:@"Name"];
        self.strOccasionDate = [data objectForKey:@"Date"];
        self.strOccasion = [data objectForKey:@"Occasion"];
        self.isGifted = [data objectForKey:@"Gifted"];
        
        //Find Difference between current date and occasion date
        NSDate* date = [NSDate date];
        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        NSString* dateString = [formatter stringFromDate:date];
        
        //This variable will be used to show duration of occasion when it is going to happen
        self.strOccasionformattedDate = [Utitlity dateStringFromString:self.strOccasionDate sourceFormat:@"yyyy-MM-dd" destinationFormat:@"d MMM"];
        //This variable will be used to show duration of occasion in d MMM format e.g 09 June
        self.strOccasionPublishDate = [Utitlity getDifferenceBetweenDates:dateString strEndDate:self.strOccasionDate];

    }
    return self;
}

@end
