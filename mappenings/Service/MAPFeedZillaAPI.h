//
// Created by Johnny Sparks on 10/20/14.
// Copyright (c) 2014 beergrammer. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPSessionManager;

typedef void (^MAPCategoriesHandler)(NSArray *categories, NSError *error);
typedef void (^MAPArticlesHandler)(NSArray *articles, NSError *error);

@interface MAPFeedZillaAPI : NSObject

+ (instancetype) defaultAPI;

- (instancetype) initWithSessionManager:(AFHTTPSessionManager *)manager;

- (void) categories:(MAPCategoriesHandler)handler;
- (void) subcategoriesForCategory:(NSUInteger)categoryID done:(MAPCategoriesHandler)handler;
- (void) articlesForCategory:(NSUInteger)categoryID done:(MAPArticlesHandler)handler;
- (void) articlesForCategory:(NSUInteger)categoryId subcategory:(NSUInteger)subcategoryId done:(MAPArticlesHandler)handler;

- (void) articlesForQuery:(NSString *)query done:(MAPArticlesHandler)handler;

@end