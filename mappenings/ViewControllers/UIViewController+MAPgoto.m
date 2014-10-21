//
// Created by Johnny Sparks on 10/21/14.
// Copyright (c) 2014 beergrammer. All rights reserved.
//

#import "UIViewController+MAPgoto.h"
#import <UIKit/UIKit.h>

@implementation UIViewController (MAPgoto)

- (void)goto:(UIViewController *)viewController {
    if(self.navigationController){
        [self.navigationController pushViewController:viewController animated:YES];
    } else {
        [self presentViewController:viewController animated:YES completion:nil];
    }
}

@end