//
// Created by Johnny Sparks on 10/21/14.
// Copyright (c) 2014 beergrammer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol MAPCategory;


@interface MAPCategoryViewController : UIViewController
@property (nonatomic, strong) id <MAPCategory> category;
@end