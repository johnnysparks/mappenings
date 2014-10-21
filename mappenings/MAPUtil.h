//
// Created by Johnny Sparks on 10/21/14.
// Copyright (c) 2014 beergrammer. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Underscore.h"
#define _ Underscore


@interface MAPUtil : NSObject

+ (NSInteger) intify:(NSString *)string;
+ (NSUInteger) uintify:(NSString *)string;

+ (NSDate *)dateFromRFC822String:(NSString *)string;

+ (void)toast:(NSString *)message;
@end