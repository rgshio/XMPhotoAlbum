//
//  XMPhotoListViewController.h
//  XMPhotoAlbum
//
//  Created by rgshio on 15/9/24.
//  Copyright (c) 2015年 rgshio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMPhotoListViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>
{
    NSMutableArray                  *dataArray; /**< 数据源*/
    UICollectionView                *mainCollectionView;
}

@end
