//
// Created by Johnny Sparks on 10/21/14.
// Copyright (c) 2014 beergrammer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol MAPCategory;
@class MAPArticlesTableView;
@class MAPFeedZillaAPI;


@interface MAPArticleViewController : UIViewController
- (void)setCategory:(id <MAPCategory>)category andSubcategory:(id <MAPCategory>)subcategory;
@end