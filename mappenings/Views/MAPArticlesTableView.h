//
// Created by Johnny Sparks on 10/21/14.
// Copyright (c) 2014 beergrammer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol MAPArticle;

static NSString *const kMapArticleTableCellIdentifier = @"MapArticleTableCellIdentifier";

typedef void (^MAPArticleHandler)(id<MAPArticle>);

@interface MAPArticlesTableView : UITableView
@property (nonatomic, copy) NSArray *articles;
@property (nonatomic, copy) MAPArticleHandler onTapArticle;
@end