//
//  XMPhotoScrollView.h
//  XMPhotoAlbum
//
//  Created by rgshio on 15/9/24.
//  Copyright (c) 2015年 rgshio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMPhotoScrollView : UIView <UIScrollViewDelegate>
{
    UIScrollView                    *scrollView;
    
    NSMutableArray                  *dataArray;
    NSInteger                       currentPage;
}

- (id)initWithFrame:(CGRect)frame Array:(NSMutableArray *)array Page:(NSInteger)page;

@end
