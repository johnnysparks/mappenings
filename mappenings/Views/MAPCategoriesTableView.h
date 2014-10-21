//
// Created by Johnny Sparks on 10/21/14.
// Copyright (c) 2014 beergrammer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol MAPCategory;

static NSString *const kMapCatgoriesTableCellIdentifier = @"MAPCategoryTableCellIdentifier";

typedef void (^MAPCategoryHandler)(id<MAPCategory>);

@interface MAPCategoriesTableView : UITableView
@property (nonatomic, copy) NSArray *categories;
@property (nonatomic, copy) MAPCategoryHandler onTapCategory;
@end