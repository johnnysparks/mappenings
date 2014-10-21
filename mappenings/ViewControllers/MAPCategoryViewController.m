//
// Created by Johnny Sparks on 10/21/14.
// Copyright (c) 2014 beergrammer. All rights reserved.
//

#import "MAPCategoryViewController.h"
#import "MAPCategory.h"
#import "MAPCategoriesTableView.h"
#import "MAPFeedZillaAPI.h"
#import "MAPUtil.h"


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

    [self.api subcategoriesForCategory:[MAPUtil uintify:self.category.identifier] done:^(NSArray *categories, NSError *error) {
        self.tableView.categories = categories;
    }];

    [self.tableView setOnTapCategory:^(id <MAPCategory> category) {
        NSLog(@"%@", category);
    }];
}

- (void)setCategory:(id <MAPCategory>)category {
    _category = category;
}


@end