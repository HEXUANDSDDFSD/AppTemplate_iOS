//
//  UIViewController+EX.m
//  AppTemplate_iOS
//
//  Created by hexuan on 2017/5/17.
//  Copyright © 2017年 hexuan. All rights reserved.
//

#import "UIViewController+EX.h"
#import "AppPromptBox.h"

@implementation UIViewController (EX)

- (void)showPromptBoxWithTitle:(NSString *)title {
    AppPromptBox *box = [AppPromptBox new];
    box.text = title;
    [box updateBounds];
    box.center = self.view.center;
    [self.view addSubview:box];
    
    [UIView animateWithDuration:1 delay:2
                        options:UIViewAnimationOptionTransitionNone
                     animations:^{
                         box.alpha = 0;
                         
                     } completion:^(BOOL finished) {
                         if (finished) {
                             [box removeFromSuperview];
                         }
                     }];
}

- (void)dealloc {
    NSLog(@"prompt box dealloc");
}

@end
