//
//  AppBannerView.h
//  AppTemplate_iOS
//
//  Created by hexuan on 2017/5/8.
//  Copyright © 2017年 hexuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AppBannerView;

@protocol AppBannerViewDelegate <NSObject>

- (void)bannerView:(AppBannerView *)bannerView didSeletedImgCell:(NSInteger)index;

@end

@interface AppBannerView : UIView

@property (nonatomic,weak) id<AppBannerViewDelegate> delegate;
@property (nonatomic,copy) NSArray *bannerImgList;
@property (nonatomic,assign) NSInteger bannerInterval;

@end
