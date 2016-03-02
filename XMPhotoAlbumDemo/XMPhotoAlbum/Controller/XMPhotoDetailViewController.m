//
//  XMPhotoDetailViewController.m
//  XMPhotoAlbum
//
//  Created by rgshio on 15/9/24.
//  Copyright (c) 2015年 rgshio. All rights reserved.
//

#import "XMPhotoDetailViewController.h"
#import "XMPhotoScrollView.h"

@interface XMPhotoDetailViewController ()

@end

@implementation XMPhotoDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - Load Main View
- (void)loadMainView
{
    self.title = @"详情";
    self.view.backgroundColor = [UIColor blueColor];
    
    XMPhotoScrollView *photo = [[XMPhotoScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) Array:self.dataArray Page:self.currentPage];
    [self.view addSubview:photo];
}

#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadMainView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
