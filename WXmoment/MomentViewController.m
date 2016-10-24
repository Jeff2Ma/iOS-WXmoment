//
//  MomentViewController.m
//  WXmoment
//
//  Created by JeffMa on 2016/10/24.
//  Copyright © 2016年 DW. All rights reserved.
//

#import "MomentViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface MomentViewController ()

@end

@implementation MomentViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
  
    self.navigationItem.title = @"微信朋友圈"; // 标题栏
    [self addHeader];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) addHeader {
    
    self.aHeaderView = [[UIView alloc] init];
    self.aHeaderImg = [[UIImageView alloc] init]; // 背景图
    self.aHeaderAvatar = [[UIImageView alloc] init]; // 头像
    self.aheaderName = [[UILabel alloc] init]; // 微信昵称
    
    // 包裹元素
    [self.aHeaderView setFrame:CGRectMake(0, 64, self.view.frame.size.width, 300)];
    self.aHeaderView.backgroundColor = [UIColor redColor];
    
    // 背景图
    [self.aHeaderImg setFrame:CGRectMake(0, 0, self.view.frame.size.width, 260)];
    [self.aHeaderImg setImage:[UIImage imageNamed:@"header_bg"]];
    
    // 头像
    [self.aHeaderAvatar setFrame:CGRectMake(self.aHeaderView.frame.size.width-90, 220, 70, 70)];
    [self.aHeaderAvatar setImage:[UIImage imageNamed:@"avatar"]];
    [self.aHeaderAvatar.layer setBorderWidth:0.5];
    self.aHeaderAvatar.layer.borderColor = [[UIColor colorWithWhite:0.6 alpha:1] CGColor];
    
    // 昵称
    [self.aheaderName setFrame:CGRectMake(self.aHeaderView.frame.size.width-200, 230, 100, 20)];
    self.aheaderName.text = @"JeffMa";
    self.aheaderName.textColor=[UIColor whiteColor];
    [self.aheaderName setFont:[UIFont systemFontOfSize:16]];

    [self.view addSubview:self.aHeaderView];
    [self.aHeaderView addSubview:self.aHeaderImg];
    [self.aHeaderView addSubview:self.aHeaderAvatar];
    [self.aHeaderView addSubview:self.aheaderName];




}
//
//
//// UI Element: 密码标签
//#pragma mark - addPassWordLabel
//- (void) addPassWordLabel{
//    
//    CGFloat PassWordLabelW = 38;
//    CGFloat PassWordLabelH = 34;
//    CGFloat PassWordLabelL = 20;
//    CGFloat PassWordLabelT = 260;
//    
//    self.aPassWordLabel = [[UILabel alloc]init];
//    self.aPassWordLabel.text = @"密码";
//    self.aPassWordLabel.textColor=[UIColor blackColor];
//    
//    [self.aPassWordLabel setFrame:CGRectMake(PassWordLabelL,PassWordLabelT,PassWordLabelW,PassWordLabelH)];
//    [self.view addSubview:self.aPassWordLabel];
//}


@end