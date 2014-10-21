//
// Created by Johnny Sparks on 10/21/14.
// Copyright (c) 2014 beergrammer. All rights reserved.
//

#import "MAPArticlesTableView.h"
#import "MAPArticle.h"

@interface MAPArticlesTableView () <UITableViewDataSource, UITableViewDelegate>
@end

@implementation MAPArticlesTableView


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }

    return self;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(self.onTapArticle){
        self.onTapArticle(self.articles[(NSUInteger) indexPath.item]);
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.articles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMapArticleTableCellIdentifier];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kMapArticleTableCellIdentifier];
    }

    id<MAPArticle> article = self.articles[(NSUInteger) indexPath.item];
    cell.detailTextLabel.text = article.summary;
    cell.textLabel.text = article.title;
    return cell;
}

- (void)setArticles:(NSArray *)articles {
    _articles = [articles mutableCopy];
    [self reloadData];
}


@end