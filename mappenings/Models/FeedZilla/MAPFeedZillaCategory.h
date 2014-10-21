//
// Created by Johnny Sparks on 10/21/14.
// Copyright (c) 2014 beergrammer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAPCategory.h"


@interface MAPFeedZillaCategory : NSObject <MAPCategory>
@property (nonatomic) NSInteger categoryId;
@property (nonatomic, copy) NSString *name;

+ (instancetype)categoryFromDict:(NSDictionary *)dict;
+ (instancetype) subcategoryFromDict:(NSDictionary *)dict;

+ (NSArray *) categoriesFromDicts:(NSArray *)dicts;
+ (NSArray *) subcategoriesFromDicts:(NSArray *)dicts;

- (NSString *)description;

@end