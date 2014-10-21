//
// Created by Johnny Sparks on 10/20/14.
// Copyright (c) 2014 beergrammer. All rights reserved.
//

#import "MAPFeedZillaAPI.h"
#import "AFHTTPSessionManager.h"
#import "MAPFeedZillaCategory.h"
#import "MAPFeedZillaArticle.h"


@interface MAPFeedZillaAPI ()
@property(nonatomic, strong) AFHTTPSessionManager *manager;
@end

@implementation MAPFeedZillaAPI

+ (instancetype)defaultAPI {

    static MAPFeedZillaAPI *sMapDefaultAPI;
    static dispatch_once_t once_t;
    dispatch_once(&once_t, ^{
        NSURL *baseURL = [NSURL URLWithString:@"http://api.feedzilla.com"];
        AFHTTPSessionManager* manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
        sMapDefaultAPI = [[self alloc] initWithSessionManager:manager];
    });

    return sMapDefaultAPI;
}

- (instancetype)initWithSessionManager:(AFHTTPSessionManager *)manager {
    if(self = [super init]){
        self.manager = manager;
    }
    return self;
}

- (void)categories:(MAPCategoriesHandler)handler {
    [self.manager GET:@"v1/categories.json" parameters:nil success:^(NSURLSessionDataTask *task, NSArray *categoryDictionaries) {
        NSArray *categories = [MAPFeedZillaCategory categoriesFromDicts:categoryDictionaries];
        handler(categories, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        handler(nil, error);
    }];
}

- (void)subcategoriesForCategory:(NSUInteger)categoryID done:(MAPCategoriesHandler)handler {
    NSAssert(categoryID, @"Cannot fetch a subcategory without a category");

    NSString *path = [NSString stringWithFormat:@"v1/categories/%d/subcategories.json", categoryID];

    [self.manager GET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        handler([MAPFeedZillaCategory subcategoriesFromDicts:responseObject], nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        handler(nil, error);
    }];
}

- (void)articlesForCategory:(NSUInteger)categoryID done:(MAPArticlesHandler)handler {

    NSAssert(categoryID, @"Cannot fetch articles without a category");

    NSString *path = [NSString stringWithFormat:@"v1/categories/%d/articles.json", categoryID];

    [self.manager GET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        handler([MAPFeedZillaArticle articlesFromDicts:responseObject[@"articles"]], responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        handler(nil, nil, error);
    }];
}

- (void)articlesForCategory:(NSUInteger)categoryId subcategory:(NSUInteger)subcategoryId done:(MAPArticlesHandler)handler {
    NSAssert(categoryId, @"Cannot fetch articles without a category");
    NSAssert(subcategoryId, @"Cannot fetch articles without a subcategory");

    NSString *path = [NSString stringWithFormat:@"v1/categories/%d/subcategories/%d/articles.json", categoryId, subcategoryId];

    [self.manager GET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        handler([MAPFeedZillaArticle articlesFromDicts:responseObject[@"articles"]], responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        handler(nil, nil, error);
    }];
}

- (void)articlesForQuery:(NSString *)query done:(MAPArticlesHandler)handler {

    NSString *path = [NSString stringWithFormat:@"v1/articles/search.json"];

    NSDictionary *params = @{
            @"q" : query,
    };

    [self.manager GET:path parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        handler([MAPFeedZillaArticle articlesFromDicts:responseObject[@"articles"]], responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        handler(nil, nil, error);
    }];
}


@end