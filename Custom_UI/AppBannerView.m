//
//  AppBannerView.m
//  AppTemplate_iOS
//
//  Created by hexuan on 2017/5/8.
//  Copyright © 2017年 hexuan. All rights reserved.
//

#import "AppBannerView.h"
#import "UIView+EX.h"

@interface AppBannerView()<UIScrollViewDelegate>

@end

@implementation AppBannerView {
    UIImageView *leftView;
    UIImageView *rightView;
    int current;
    BOOL isShowLeft;
    NSArray *_bannerImgList;
    UIScrollView *_scrollView;
    UIPageControl *pageControl;
    NSTimer *timer;
}

- (instancetype)initWithFrame:(CGRect)frame {
    current = 0;
    if(self = [super initWithFrame:frame]){
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        [self addSubview:_scrollView];
        
        self.bannerInterval = 3; //default
        
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate =  self;
        
        [_scrollView addSubview:leftView];
        [_scrollView addSubview:rightView];
        
        leftView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        rightView = [[UIImageView alloc] initWithFrame:CGRectMake(self.width, 0, self.width, self.height)];
        [_scrollView addSubview:leftView];
        [_scrollView addSubview:rightView];
        
        leftView.userInteractionEnabled = rightView.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction)];
        [leftView addGestureRecognizer:tapGesture];
        [rightView addGestureRecognizer:tapGesture];
        
        pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.height - 30, self.width, 20)];
        pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        pageControl.userInteractionEnabled = NO;
        pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
        [self addSubview:pageControl];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:self.bannerInterval target:self selector:@selector(bannerAnimation) userInfo:nil repeats:YES];
        [self pauseTimer];
    }
    return self;
}

- (void)tapGestureAction {
    if ([_delegate respondsToSelector:@selector(bannerView:didSeletedImgCell:)]) {
        [_delegate bannerView:self didSeletedImgCell:pageControl.currentPage];
    }
}

- (void)pauseTimer {
    [timer setFireDate:[NSDate distantFuture]];
}

- (void)resumeTimer {
    [timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:self.bannerInterval]];
}

- (void)removeFromSuperview {
    [super removeFromSuperview];
    [timer invalidate];
}

- (void)bannerAnimation {
    if (_scrollView.contentOffset.x > self.width / 2) {
        [self rightResetImg];
    }
    [_scrollView setContentOffset:CGPointMake(self.width, 0) animated:YES];
}

- (void)setBannerImgList:(NSArray *)bannerImgList {
    if ([bannerImgList count] == 0) {
        return;
    }
    
    _bannerImgList = [bannerImgList copy];
    pageControl.numberOfPages = [_bannerImgList count];
    if ([bannerImgList count] == 1){
        [self pauseTimer];
        leftView.image = _bannerImgList[0];
        _scrollView.contentSize = CGSizeMake(self.width, self.height);
    }
    else {
        [self resumeTimer];
        _scrollView.contentSize = CGSizeMake(self.width * 2, self.height);
        leftView.image = _bannerImgList[0];
        rightView.image = _bannerImgList[1];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self pauseTimer];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (decelerate){
        [self resumeTimer];
    }
}

- (void)rightResetImg {
    NSInteger sum = [_bannerImgList count];
    leftView.image = rightView.image;
    current++;
    if (current >= sum) {
        current = 0;
    }
    int rightImgIndex = current + 1;
    if (rightImgIndex >= sum) {
        rightImgIndex = 0;
    }
    rightView.image = _bannerImgList[rightImgIndex];
    _scrollView.contentOffset = CGPointMake(0, 0);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger sum = [_bannerImgList count];
    
    if (scrollView.contentOffset.x < self.width / 2) {
        isShowLeft = YES;
    }
    else {
        isShowLeft = NO;
    }
    int pageIndex = current + !isShowLeft;
    if (pageIndex < 0) {
        pageIndex += sum;
    }
    if (pageIndex > sum - 1) {
        pageIndex = 0;
    }
    pageControl.currentPage = pageIndex;
    
    if  (scrollView.contentOffset.x < 0){
        
        rightView.image = leftView.image;
        current--;
        if (current < 0) {
            current+= sum;
        }
        leftView.image = _bannerImgList[current];
        scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x + self.width, 0);
    }
    else if (scrollView.contentOffset.x > self.width){
        [self rightResetImg];
    }
}
@end
