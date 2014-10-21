//
// Created by Johnny Sparks on 10/20/14.
// Copyright (c) 2014 beergrammer. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MAPArticle <NSObject>
- (NSString *)identifier;
- (NSString *)title;
- (NSString *)summary;
- (NSString *)author;
- (NSDate *)publishDate;
- (NSURL *)source;
@end