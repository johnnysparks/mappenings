//
// Created by Johnny Sparks on 10/21/14.
// Copyright (c) 2014 beergrammer. All rights reserved.
//

#import "MAPCategoryViewController.h"
#import "MAPCategory.h"
#import "MAPCategoriesTableView.h"
#import "MAPFeedZillaAPI.h"
#import "MAPUtil.h"
#import "MAPArticleViewController.h"
#import "UIViewController+MAPgoto.h"


@interface MAPCategoryViewController ()
@property(nonatomic, strong) MAPCategoriesTableView *tableView;
@property(nonatomic, strong) MAPFeedZillaAPI *api;
@end

@implementation MAPCategoryViewController

- (void)loadView {
    [super loadView];
    self.tableView = [MAPCategoriesTableView new];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = self.category.name ?: @"Unknown";

    NSDictionary *views = @{ @"table" : self.tableView };
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[table]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[table]|" options:0 metrics:nil views:views]];

    self.api = [MAPFeedZillaAPI defaultAPI];

    [self.tableView setOnTapCategory:^(id <MAPCategory> category) {
        MAPArticleViewController *vc = [MAPArticleViewController new];
        [vc setCategory:self.category andSubcategory:category];
        [self goto:vc];
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [MAPUtil toast:@"Loading Sections..."];
    [self.api subcategoriesForCategory:[MAPUtil uintify:self.category.identifier] done:^(NSArray *categories, NSError *error) {
        self.tableView.categories = categories;
    }];
}


- (void)setCategory:(id <MAPCategory>)category {
    _category = category;
}


@end