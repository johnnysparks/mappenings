//
// Created by Johnny Sparks on 10/21/14.
// Copyright (c) 2014 beergrammer. All rights reserved.
//

#import "MAPUtil.h"
#import "CRToast.h"
#import <UIKit/UIKit.h>


@implementation MAPUtil

+ (NSInteger)intify:(NSString *)string {
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    return [f numberFromString:string].integerValue;
}

+ (NSUInteger)uintify:(NSString *)string {
    return (NSUInteger)[self intify:string];
}

/**
* EXAMPLE DATE:
* Mon, 06 Sep 2009 16:45:00 -0900
*/
+ (NSDate *) dateFromRFC822String:(NSString *) string {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [dateFormatter setLocale:locale];
    [dateFormatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss Z"];

    NSDate *date = [dateFormatter dateFromString:string];
    return date;
}

+ (void) toast:(NSString *)message {
    [CRToastManager dismissNotification:NO];

    NSParameterAssert(message);

    NSDictionary *opts = @{
            kCRToastBackgroundColorKey : [UIColor colorWithWhite:0.95 alpha:1],
            kCRToastTextColorKey : [UIColor colorWithHue:0.83 saturation:0.5 brightness:0.85 alpha:1],
            kCRToastNotificationTypeKey : @(CRToastTypeStatusBar),
            kCRToastTextKey : message,
    };

    [CRToastManager showNotificationWithOptions:opts completionBlock:nil];
}

@end