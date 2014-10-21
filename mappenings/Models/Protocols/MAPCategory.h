//
// Created by Johnny Sparks on 10/21/14.
// Copyright (c) 2014 beergrammer. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MAPCategory <NSObject>
- (NSString *)parentIdentifier;
- (NSString *)identifier;
- (NSString *)name;
@end