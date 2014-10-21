//
// Created by Johnny Sparks on 10/21/14.
// Copyright (c) 2014 beergrammer. All rights reserved.
//

#import "MAPFeedZillaCategory.h"
#import "MAPUtil.h"


@interface MAPFeedZillaCategory ()
@property(nonatomic) NSInteger parentCategoryId;
@property(nonatomic, strong) NSDictionary *originalData;
@end

@implementation MAPFeedZillaCategory

+ (instancetype)categoryFromDict:(NSDictionary *)dict {
    NSAssert(dict, @"Dictinary required");

    MAPFeedZillaCategory *category = [[MAPFeedZillaCategory alloc] init];
    category.categoryId = [dict[@"category_id"] integerValue];
    category.name = dict[@"english_category_name"];
    category.originalData = dict;
    return category;
}


+ (instancetype)subcategoryFromDict:(NSDictionary *)dict {
    NSAssert(dict, @"Dictinary required");

    MAPFeedZillaCategory *category = [[MAPFeedZillaCategory alloc] init];
    category.categoryId = [dict[@"subcategory_id"] integerValue];
    category.parentCategoryId = [dict[@"category_id"] integerValue];
    category.name = dict[@"english_subcategory_name"];
    category.originalData = dict;

    return category;
}

+ (NSArray *)categoriesFromDicts:(NSArray *)dicts {
    return _.arrayMap(dicts, ^(NSDictionary *dict) {
        return [self categoryFromDict:dict];
    });
}

+ (NSArray *)subcategoriesFromDicts:(NSArray *)dicts {
    return _.arrayMap(dicts, ^(NSDictionary *dict) {
        return [self subcategoryFromDict:dict];
    });
}

- (NSString *)parentIdentifier {
    return [@(self.parentCategoryId) stringValue];
}

- (NSString *)identifier {
    return [@(self.categoryId) stringValue];
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"self.categoryId=%i", self.categoryId];
    [description appendFormat:@", self.name=%@", self.name];
    [description appendFormat:@", self.parentCategoryId=%i", self.parentCategoryId];
    [description appendFormat:@", self.originalData=%@", self.originalData];
    [description appendString:@">"];
    return description;
}


@end