//
//  Utitlity.m
//  GifteryDemo
//
//  Created by Amit Pandey on 14/06/17.
//  Copyright © 2017 Amit Pandey. All rights reserved.
//

#import "Utitlity.h"

@implementation Utitlity


+ (NSString *)dateStringFromString:(NSString *)sourceString
                      sourceFormat:(NSString *)sourceFormat
                 destinationFormat:(NSString *)destinationFormat
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [dateFormatter setDateFormat:sourceFormat];
    NSDate *date = [dateFormatter dateFromString:sourceString];
    [dateFormatter setDateFormat:destinationFormat];
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)getDifferenceBetweenDates:(NSString *)strStartDate strEndDate:(NSString *)strEndDate {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate * fromDate = [formatter dateFromString:strStartDate];
    NSDate *toDate      = [formatter dateFromString:strEndDate];
    NSCalendar *calender = [NSCalendar currentCalendar];
    NSUInteger units = (NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitYear);
    NSDateComponents *dateComponents = [calender components:units fromDate:fromDate toDate:toDate options:0];
    
    NSString *duration = nil;
    if (dateComponents.month) {
        //Different months
        duration = [NSString stringWithFormat:@"%ld months",(long)dateComponents.month];
    }else{
        //Same month
        duration = [NSString stringWithFormat:@"%ld days",(long)dateComponents.day];
    }
    NSLog(@"Duration : %@",duration);
    return duration;
}

//+(UIColor *)colorFromHex:(NSString *)hex {
//    unsigned int c;
//    if ([hex characterAtIndex:0] == '#') {
//        [[NSScanner scannerWithString:[hex substringFromIndex:1]] scanHexInt:&c];
//    } else {
//        [[NSScanner scannerWithString:hex] scanHexInt:&c];
//    }
//    return [UIColor colorWithRed:((c & 0xff0000) >> 16)/255.0
//                           green:((c & 0xff00) >> 8)/255.0
//                            blue:(c & 0xff)/255.0 alpha:1.0];
//}

@end
