//
//  XMSingalImageView.h
//  XMPhotoAlbum
//
//  Created by rgshio on 15/9/24.
//  Copyright (c) 2015年 rgshio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMSingalImageView : UIScrollView <UIScrollViewDelegate>
{
    UIImageView                     *imageView;
}

- (id)initWithFrame:(CGRect)frame image:(UIImage *)image;

@end
