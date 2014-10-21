//
//  MAPRootViewController.m
//  mappenings
//
//  Created by Johnny Sparks on 10/20/14.
//  Copyright (c) 2014 beergrammer. All rights reserved.
//

#import "MAPRootViewController.h"
#import "MAPCategoriesTableView.h"
#import "MAPFeedZillaAPI.h"
#import "MAPUtil.h"
#import "MAPFeedZillaCategory.h"
#import "MAPCategoryViewController.h"
#import "MAPRootViewController+gotoViewController.h"

@interface MAPRootViewController ()
@property(nonatomic, strong) MAPCategoriesTableView *tableView;
@property(nonatomic, strong) MAPFeedZillaAPI *api;
@end

@implementation MAPRootViewController

- (void)loadView {
    [super loadView];
    self.tableView = [MAPCategoriesTableView new];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.tableView];
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Mappenings";

    NSDictionary *views = @{ @"table" : self.tableView };
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[table]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[table]|" options:0 metrics:nil views:views]];

    self.api = [MAPFeedZillaAPI defaultAPI];

    [self.tableView setOnTapCategory:^(id <MAPCategory> category) {
        MAPCategoryViewController *vc = [[MAPCategoryViewController alloc] init];
        vc.category = category;
        [self goto:vc];
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.api categories:^(NSArray *categories, NSError *error) {
        if(error) [MAPUtil toast:error.localizedDescription];
        self.tableView.categories = categories;
    }];
}

@end
