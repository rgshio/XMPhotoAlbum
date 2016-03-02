//
//  XMSingalImageView.m
//  XMPhotoAlbum
//
//  Created by rgshio on 15/9/24.
//  Copyright (c) 2015年 rgshio. All rights reserved.
//

#import "XMSingalImageView.h"

@implementation XMSingalImageView

- (id)initWithFrame:(CGRect)frame image:(UIImage *)image
{
    self = [super initWithFrame:frame];
    if (self) {
        
        imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        imageView.image = image;
        self.maximumZoomScale = 2.0;
        self.minimumZoomScale = 1;
        self.delegate = self;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        [self addSubview:imageView];
        // 增加手势
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
        tap.numberOfTapsRequired = 2;
        [imageView addGestureRecognizer:tap];
        
    }
    return self;
}

- (void)tapClick:(UITapGestureRecognizer *)tap
{
    if (self.zoomScale >= 2) {
        // self.zoomScale = 1;
        [self setZoomScale:1 animated:YES];
    } else {
        CGPoint curPoint = [tap locationInView:self];
        // 将一个rect的范围，放大到全屏!
        
        [self zoomToRect:CGRectMake(curPoint.x-80, curPoint.y-80, 160, 160) animated:YES];//这里的160是什么意思？
    }
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return imageView;
}

@end
