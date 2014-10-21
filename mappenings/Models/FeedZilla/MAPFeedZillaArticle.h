//
// Created by Johnny Sparks on 10/21/14.
// Copyright (c) 2014 beergrammer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAPArticle.h"


@interface MAPFeedZillaArticle : NSObject <MAPArticle>

@property (nonatomic, copy) NSString *sourceSite;
@property (nonatomic, copy) NSURL *source;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSDate *publishDate;
@property (nonatomic, copy) NSString *author;

+ (instancetype) articleFromDict:(NSDictionary *)dict;

+ (NSArray *)articlesFromDicts:(NSArray *)dicts;

- (NSString *)description;

@end