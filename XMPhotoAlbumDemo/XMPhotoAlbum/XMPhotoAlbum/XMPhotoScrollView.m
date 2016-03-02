//
//  XMPhotoScrollView.m
//  XMPhotoAlbum
//
//  Created by rgshio on 15/9/24.
//  Copyright (c) 2015年 rgshio. All rights reserved.
//

#import "XMPhotoScrollView.h"
#import "XMSingalImageView.h"

@implementation XMPhotoScrollView

- (id)initWithFrame:(CGRect)frame Array:(NSMutableArray *)array Page:(NSInteger)page
{
    self = [super initWithFrame:frame];
    if (self) {
        currentPage = page;
        dataArray = array;
        
        scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 325, self.frame.size.height)];
        for (int i=0; i<array.count; i++) {
            NSString *str = [array objectAtIndex:i];
            UIImageView *imageView = [[UIImageView alloc] init];
            [imageView sd_setImageWithURL:[NSURL URLWithString:str] placeholderImage:[UIImage imageNamed:@""] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                XMSingalImageView *imageV = [[XMSingalImageView alloc] initWithFrame:CGRectMake(i*325, 0, 320, scrollView.frame.size.height) image:imageView.image];
                [scrollView addSubview:imageV];
            }];
        }
        
        scrollView.pagingEnabled = YES;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        scrollView.contentSize = CGSizeMake(325*array.count, 0);
        scrollView.contentOffset = CGPointMake(325*page, 0);
        scrollView.delegate = self;
        [self addSubview:scrollView];
        
    }
    return self;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scroll
{
    for (XMSingalImageView *sv in scrollView.subviews) {
        // zoomScale变形后的值!!
        if (sv.zoomScale != 1) {
            sv.zoomScale = 1;
        }
    }
    currentPage = scrollView.contentOffset.x/325;
    NSDictionary *dict = [dataArray objectAtIndex:currentPage];
}

@end
