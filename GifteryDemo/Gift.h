//
//  Gift.h
//  GifteryDemo
//
//  Created by Amit Pandey on 13/06/17.
//  Copyright © 2017 Amit Pandey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Gift : NSObject
@property (strong, nonatomic) NSString *strName;
@property (strong, nonatomic) NSString *strOccasion;
@property (strong, nonatomic) NSString *strOccasionDate;
@property (strong, nonatomic) NSString *isGifted;
@property (strong, nonatomic) NSString *strOccasionPublishDate;
@property (strong, nonatomic) NSString *strOccasionformattedDate;

-(id)initWithData:(NSDictionary *)data;

@end
