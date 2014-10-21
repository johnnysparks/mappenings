//
// Created by Johnny Sparks on 10/21/14.
// Copyright (c) 2014 beergrammer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol MAPArticle;

@interface MAPArticleView : UIView
@property (nonatomic, strong) id <MAPArticle> article;
@end