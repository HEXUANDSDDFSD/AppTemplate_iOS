//
//  UIButton+EX.m
//  AppTemplate_iOS
//
//  Created by hexuan on 2017/5/7.
//  Copyright © 2017年 hexuan. All rights reserved.
//

#import "UIButton+EX.h"

@implementation UIButton (EX)

+ (UIButton *)publicTestButtonWithTitle:(NSString *)title
                                 target:(id)target
                             upInAction:(SEL)action
                              superView:(UIView *)superView {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 100, 50);
    button.backgroundColor = [UIColor orangeColor];
    [superView addSubview:button];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIButton *)buttonWithBgImgName:(NSString *)imgName
                           target:(id)target
                       upInAction:(SEL)action
                        superView:(UIView *)superView {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [superView addSubview:button];
    return button;
}


@end
