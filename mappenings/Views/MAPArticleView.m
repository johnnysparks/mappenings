//
// Created by Johnny Sparks on 10/21/14.
// Copyright (c) 2014 beergrammer. All rights reserved.
//

#import "MAPArticleView.h"
#import "MAPArticle.h"


@interface MAPArticleView ()
@property(nonatomic, strong) UIScrollView *contentView;
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UILabel *dateLabel;
@property(nonatomic, strong) UILabel *summaryLabel;
@end

@implementation MAPArticleView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    CGRect bounds = frame;
    bounds.origin = CGPointZero;

    if (self) {
        self.contentView = [[UIScrollView alloc] initWithFrame:bounds];
        self.contentView.contentSize = bounds.size;
        [self.contentView addSubview:self.contentView];

        self.titleLabel = [[UILabel alloc] initWithFrame:bounds];
        self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.titleLabel.numberOfLines = 0;
        [self.contentView addSubview:self.titleLabel];

        self.dateLabel = [[UILabel alloc] initWithFrame:bounds];
        [self.contentView addSubview:self.dateLabel];

        self.summaryLabel = [[UILabel alloc] initWithFrame:bounds];
        self.summaryLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.summaryLabel.numberOfLines = 0;
        [self.contentView addSubview:self.summaryLabel];
    }

    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

}

- (void)setArticle:(id <MAPArticle>)article {
    _article = article;
    self.titleLabel.text = article.title;
    self.dateLabel.text = [NSDateFormatter localizedStringFromDate:article.publishDate dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle];
    self.summaryLabel.text = article.summary;
}


@end