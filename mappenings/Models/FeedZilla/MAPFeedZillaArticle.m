//
// Created by Johnny Sparks on 10/21/14.
// Copyright (c) 2014 beergrammer. All rights reserved.
//

#import "MAPFeedZillaArticle.h"
#import "MAPUtil.h"


@interface MAPFeedZillaArticle ()
@property(nonatomic, strong) NSDictionary *originalData;
@end

@implementation MAPFeedZillaArticle
- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"self.sourceSite=%@", self.sourceSite];
    [description appendFormat:@", self.source=%@", self.source];
    [description appendFormat:@", self.title=%@", self.title];
    [description appendFormat:@", self.summary=%@", self.summary];
    [description appendFormat:@", self.publishDate=%@", self.publishDate];
    [description appendFormat:@", self.author=%@", self.author];
    [description appendFormat:@", self.originalData=%@", self.originalData];
    [description appendString:@">"];
    return description;
}

+ (instancetype)articleFromDict:(NSDictionary *)dict {

    MAPFeedZillaArticle *article = [[MAPFeedZillaArticle alloc] init];

    article.title = dict[@"title"];
    article.author = dict[@"author"];
    article.publishDate = [MAPUtil dateFromRFC822String:dict[@"publish_date"]];
    article.summary = dict[@"summary"];
    article.source = [NSURL URLWithString:dict[@"url"]];
    article.sourceSite = dict[@"source"];
    article.originalData = dict;

    return nil;
}

+ (NSArray *)articlesFromDicts:(NSArray *)dicts {
    return _.arrayMap(dicts, ^(NSDictionary *dict){
        return [self articleFromDict:dict];
    });
}

- (NSString *)identifier {
    return self.source.absoluteString;
}


@end