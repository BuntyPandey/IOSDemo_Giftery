//
//  Utitlity.h
//  GifteryDemo
//
//  Created by Amit Pandey on 14/06/17.
//  Copyright © 2017 Amit Pandey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utitlity : NSObject

+ (NSString *)dateStringFromString:(NSString *)sourceString
                      sourceFormat:(NSString *)sourceFormat
                 destinationFormat:(NSString *)destinationFormat;

+ (NSString *)getDifferenceBetweenDates:(NSString *)strStartDate strEndDate:(NSString *)strEndDate;
//+(UIColor *)colorFromHex:(NSString *)hex;

@end
