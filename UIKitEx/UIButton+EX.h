//
//  UIButton+EX.h
//  AppTemplate_iOS
//
//  Created by hexuan on 2017/5/7.
//  Copyright © 2017年 hexuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (EX)

+ (UIButton *)publicTestButtonWithTitle:(NSString *)title;

+ (UIButton *)buttonWithBgImgName:(NSString *)imgName
                           target:(id)target
                       upInAction:(SEL)action
                        superView:(UIView *)superView;

@end
