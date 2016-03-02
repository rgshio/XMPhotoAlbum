//
//  XMPhotoListViewController.m
//  XMPhotoAlbum
//
//  Created by rgshio on 15/9/24.
//  Copyright (c) 2015年 rgshio. All rights reserved.
//

#import "XMPhotoListViewController.h"
#import "XMPhotoDetailViewController.h"

@interface XMPhotoListViewController ()

@end

@implementation XMPhotoListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSArray *)loadArray
{
    NSArray *array = @[@"http://img0.bdstatic.com/img/image/6446027056db8afa73b23eaf953dadde1410240902.jpg",
                       @"http://e.hiphotos.baidu.com/image/w%3D230/sign=594c7a03950a304e5222a7f9e1c8a7c3/0824ab18972bd40791a9ddfa79899e510fb3094e.jpg",
                       @"http://b.hiphotos.baidu.com/image/w%3D230/sign=4665ef3037fae6cd0cb4ac623fb30f9e/f9198618367adab49ba3154489d4b31c8701e442.jpg",
                       @"http://d.hiphotos.baidu.com/image/w%3D230/sign=4b1fc32e8418367aad8978de1e738b68/54fbb2fb43166d22b4041b93442309f79052d242.jpg",
                       @"http://f.hiphotos.baidu.com/image/w%3D230/sign=77a701b0eb50352ab161220b6343fb1a/8435e5dde71190ef3b929cd8cc1b9d16fdfa604f.jpg",
                       @"http://c.hiphotos.baidu.com/image/w%3D230/sign=937d3162b119ebc4c078719ab226cf79/0bd162d9f2d3572cfb9392db8813632762d0c340.jpg",
                       @"http://g.hiphotos.baidu.com/image/w%3D230/sign=13f5ae0f42166d223877129776220945/c75c10385343fbf2f41f8fe7b17eca8064388fc6.jpg",
                       @"http://a.hiphotos.baidu.com/image/w%3D230/sign=8382b56bfa1986184147e8877aec2e69/3c6d55fbb2fb43165dbb4a7022a4462309f7d317.jpg",
                       @"http://d.hiphotos.baidu.com/image/w%3D230/sign=bacbb63479ec54e741ec1d1d89399bfd/d058ccbf6c81800a822cb204b33533fa838b47ea.jpg",
                       @"http://g.hiphotos.baidu.com/image/w%3D230/sign=d46b7b1613dfa9ecfd2e511452d1f754/242dd42a2834349b2583778fcbea15ce36d3be36.jpg",
                       @"http://b.hiphotos.baidu.com/image/w%3D230/sign=87b8695a0e3387449cc5287f610ed937/30adcbef76094b36dd332ce7a1cc7cd98d109d12.jpg",
                       @"http://g.hiphotos.baidu.com/image/w%3D230/sign=c5408b49c88065387beaa310a7dda115/ae51f3deb48f8c54c2bdcb2838292df5e0fe7f4e.jpg",
                       @"http://a.hiphotos.baidu.com/image/w%3D230/sign=4b3ba1c9f536afc30e0c38668318eb85/1c950a7b02087bf442a5bbe0f0d3572c11dfcf6a.jpg",
                       @"http://f.hiphotos.baidu.com/image/w%3D230/sign=66206b1c8544ebf86d71633ce9f9d736/caef76094b36acaf239dc4e37ed98d1001e99cab.jpg",
                       @"http://h.hiphotos.baidu.com/image/w%3D230/sign=ace4b911cdfc1e17fdbf8b327a90f67c/a8ec8a13632762d0184eaab8a2ec08fa513dc641.jpg",
                       ];
    
    return array;
}

#pragma mark - Init Parameters
- (void)initParameters
{
    self.title = @"图片列表";
    
    dataArray = [[NSMutableArray alloc] initWithArray:[self loadArray]];
}

#pragma mark - Load Main View
- (void)loadMainView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:flowLayout];
    [mainCollectionView registerNib:[UINib nibWithNibName:@"XMPhotoListCell" bundle:nil] forCellWithReuseIdentifier:@"PhotoListCell"];
    mainCollectionView.delegate = self;
    mainCollectionView.dataSource = self;
    [self.view addSubview:mainCollectionView];
}

#pragma mark - UICollectionView
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"PhotoListCell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
    NSString *str = dataArray[indexPath.row];
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
    [imageView sd_setImageWithURL:[NSURL URLWithString:str] placeholderImage:[UIImage imageNamed:@"aa64034f78f0f7366f7d4c0a0855b319ebc4133d"]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    XMPhotoDetailViewController *photoDetail = [[XMPhotoDetailViewController alloc] init];
    photoDetail.dataArray = dataArray;
    photoDetail.currentPage = indexPath.row;
    [self.navigationController pushViewController:photoDetail animated:YES];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(140, 210);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initParameters];
    [self loadMainView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
