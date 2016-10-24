//
//  ViewController.m
//  WXmoment
//
//  Created by JeffMa on 2016/10/24.
//  Copyright © 2016年 DW. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.title = @"微信登录";

    // Do any additional setup after loading the view, typically from a nib.
    [self addAvatar];
    [self addUserName];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 微信号
-(void)addUserName{
    UILabel *aName = [[UILabel alloc]initWithFrame:CGRectMake(40, 600, 380, 80)];
    aName.numberOfLines = 0;
    aName.textColor = [UIColor grayColor];
    aName.backgroundColor = [UIColor clearColor];
    aName.textAlignment = NSTextAlignmentCenter; // 文本对齐方式
    
    // 通过计算文本的尺寸来定位
    // 定位方法：http://blog.csdn.net/enuola/article/details/8559588
    // 修正过时的函数：http://blog.csdn.net/jymn_chen/article/details/10949279
    // 修复参考：http://wahenzan.com/a/mdev/ios/2016/1011/10890.html
    
    NSString *strName = @"Jeff2Ma ";
    
    // old way
    // CGSize nameSize = [strName sizeWithFont:aName.font constrainedToSize:CGSizeMake(MAXFLOAT, aName.frame.size.height)];
    
    // new way
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:16]};
    CGSize nameSize = [strName boundingRectWithSize:CGSizeMake(1000, 20) options: NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;

    // 基本单位
    CGRect bound = [[UIScreen mainScreen] bounds];
    CGFloat NameLeft = bound.size.width/2 - nameSize.width/2;
    CGFloat NameTop = 145;
    
    // 根据 name 的长度重新设置位置
    [aName setFrame:CGRectMake(NameLeft, NameTop, nameSize.width, 120)];
    
    aName.text = strName;
    
    [self.view addSubview:aName];
}

// 头像
-(void)addAvatar{
    // 图片定位
    CGRect bound = [[UIScreen mainScreen] bounds];
    CGFloat avatarWidth = 80;
    CGFloat avatarHeight = 80;
    CGFloat avatarLeft = bound.size.width/2 - avatarWidth/2;
    CGFloat avatarTop = 100;
    
    UIImageView *aAvatar = [[UIImageView alloc]initWithFrame:CGRectMake(avatarLeft,avatarTop,avatarWidth,avatarHeight)];
    [aAvatar setImage:[UIImage imageNamed:@"avatar"]];
    [aAvatar setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:aAvatar];
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

@end
