//
// Created by Johnny Sparks on 10/21/14.
// Copyright (c) 2014 beergrammer. All rights reserved.
//

#import "MAPArticleViewController.h"
#import "MAPCategory.h"
#import "MAPFeedZillaAPI.h"
#import "MAPUtil.h"
#import "MAPArticlesTableView.h"
#import "UIViewController+MAPgoto.h"


@interface MAPArticleViewController ()
@property(nonatomic, strong) MAPArticlesTableView *tableView;
@property(nonatomic, strong) MAPFeedZillaAPI *api;
@property(nonatomic, strong) id <MAPCategory> category;
@property(nonatomic, strong) id <MAPCategory> subcategory;
@end

@implementation MAPArticleViewController


- (void)loadView {
    [super loadView];
    self.tableView = [MAPArticlesTableView new];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Unknown";

    NSDictionary *views = @{ @"table" : self.tableView };
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[table]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[table]|" options:0 metrics:nil views:views]];

    self.api = [MAPFeedZillaAPI defaultAPI];
    [self.api articlesForCategory:[MAPUtil uintify:self.category.identifier]
                      subcategory:[MAPUtil uintify:self.subcategory.identifier]
                             done:^(NSArray *articles, NSDictionary *meta, NSError *error) {

        if (error){
            [MAPUtil toast:error.localizedDescription];
            return;
        }

        if(meta[@"description"]){
            self.title = meta[@"description"];
        }

        self.tableView.articles = articles;
    }];

    [self.tableView setOnTapArticle:^(id <MAPArticle> article) {
        NSLog(@"%@", article);
    }];
}


- (void)setCategory:(id <MAPCategory>)category andSubcategory:(id <MAPCategory>)subcategory {
    self.category = category;
    self.subcategory = subcategory;
}


@end