//
//  AppPromptBox.m
//  AppTemplate_iOS
//
//  Created by hexuan on 2017/5/16.
//  Copyright © 2017年 hexuan. All rights reserved.
//

#import "AppPromptBox.h"

@implementation AppPromptBox


- (instancetype)init {
    if (self = [super init]) {
        self.textColor = [UIColor whiteColor];
        self.edgeInsets = UIEdgeInsetsMake(30, 20, 10, 20);
        self.layer.cornerRadius = 5;
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

- (void)updateBounds {
    NSDictionary *attributes = @{NSFontAttributeName:self.font};
    CGSize textSize = [self.text sizeWithAttributes:attributes];
    self.bounds = CGRectMake(0, 0, textSize.width + _edgeInsets.left + _edgeInsets.right, textSize.height + _edgeInsets.top + _edgeInsets.bottom);
}

- (void)drawTextInRect:(CGRect)rect {
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, _edgeInsets)];
}

@end
