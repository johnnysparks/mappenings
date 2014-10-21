//
// Created by Johnny Sparks on 10/21/14.
// Copyright (c) 2014 beergrammer. All rights reserved.
//

#import "MAPCategoriesTableView.h"
#import "MAPCategory.h"


@interface MAPCategoriesTableView () <UITableViewDataSource, UITableViewDelegate>
@end

@implementation MAPCategoriesTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }

    return self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(self.onTapCategory){
        self.onTapCategory(self.categories[(NSUInteger) indexPath.item]);
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMapCatgoriesTableCellIdentifier];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kMapCatgoriesTableCellIdentifier];
    }

    id<MAPCategory> category = self.categories[(NSUInteger) indexPath.item];
    cell.textLabel.text = category.name;
    return cell;
}

- (void)setCategories:(NSArray *)categories {
    _categories = [categories mutableCopy];
    [self reloadData];
}


@end