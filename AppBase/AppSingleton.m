//
//  AppSingleton.m
//  AppTemplate_iOS
//
//  Created by hexuan on 2017/5/8.
//  Copyright © 2017年 hexuan. All rights reserved.
//

#import "AppSingleton.h"
#import <objc/runtime.h>

@implementation AppSingleton

+ (instancetype)shareInstance {
    @synchronized (self) {
        id instance = objc_getAssociatedObject(self, "instance");
        if (instance == nil) {
            instance = [super allocWithZone:NULL];
            objc_setAssociatedObject(self, "instance", instance, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        return instance;
    }
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [self shareInstance];
}

- (instancetype)copy {
    Class selfClass = [self class];
    return [selfClass shareInstance];
}

@end
