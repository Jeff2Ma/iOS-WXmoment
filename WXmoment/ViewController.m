//
//  ViewController.m
//  WXmoment
//
//  Created by JeffMa on 2016/10/24.
//  Copyright © 2016年 DW. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"微信登录";

    // Do any additional setup after loading the view, typically from a nib.
    [self addUserName];
    [self addAvatar];
    [self addPassWordLabel];
    [self addPassWordInput];
    [self addLoginBtn];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 微信号
-(void)addUserName{
    UILabel *aName = [[UILabel alloc]init];
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
    
    [aAvatar.layer setBorderWidth:1];
    aAvatar.layer.borderColor = [[UIColor colorWithRed:226/255.0 green:230/255.0 blue:232/255.0 alpha:1] CGColor];
    
    [self.view addSubview:aAvatar];
}


// 密码标签
- (void) addPassWordLabel{
    
    CGFloat PassWordLabelW = 34;
    CGFloat PassWordLabelH = 34;
    CGFloat PassWordLabelL = 20;
    CGFloat PassWordLabelT = 260;
    
    UILabel *aPassWordLabel = [[UILabel alloc]init];
    aPassWordLabel.text = @"密码";
    aPassWordLabel.textColor=[UIColor blackColor];
    
    [aPassWordLabel setFrame:CGRectMake(PassWordLabelL,PassWordLabelT,PassWordLabelW,PassWordLabelH)];
    [self.view addSubview:aPassWordLabel];
}

// 密码输入框
- (void) addPassWordInput{
    
    CGRect bound = [[UIScreen mainScreen] bounds];
    CGFloat PassWordInputW = bound.size.width - 20*2 - 34 -10;
    CGFloat PassWordInputH = 34;
    CGFloat PassWordInputL = 20 + 34 + 10;
    CGFloat PassWordInputT = 260;
    
    UITextField *aPassWordInput = [[UITextField alloc]init];
    aPassWordInput.placeholder = @"请填写密码";
    aPassWordInput.textColor=[UIColor blackColor];
    aPassWordInput.secureTextEntry = YES; // 密码形式的输入
    [aPassWordInput setFrame:CGRectMake(PassWordInputL,PassWordInputT,PassWordInputW,PassWordInputH)];
    
    // 设置下边框
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(0.0f, aPassWordInput.frame.size.height - 1, aPassWordInput.frame.size.width, 1.0f);
    bottomBorder.backgroundColor = [UIColor colorWithRed:226/255.0 green:230/255.0 blue:232/255.0 alpha:1].CGColor;
    [aPassWordInput.layer addSublayer:bottomBorder];
    
    [self.view addSubview:aPassWordInput];
}

// 登录按钮
- (void) addLoginBtn{
    
    CGRect bound = [[UIScreen mainScreen] bounds];
    CGFloat LoginBtnW = bound.size.width - 20*2;
    CGFloat LoginBtnH = 36;
    CGFloat LoginBtnL = 20;
    CGFloat LoginBtnT = 330;

    UIButton *aLoginBtn = [[UIButton alloc] init];
    [aLoginBtn setTitle:@"登录" forState:UIControlStateNormal];
    aLoginBtn.layer.cornerRadius = 5; // 圆角
    aLoginBtn.backgroundColor = [UIColor colorWithRed:0.02 green:0.75 blue:0.01 alpha:1.00];
    [aLoginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [aLoginBtn setTitleColor:[UIColor colorWithRed:0.60 green:0.89 blue:0.59 alpha:1.00] forState:UIControlStateHighlighted];
    
    // 事件绑定
    [aLoginBtn addTarget:self action:@selector(onLoginBtnClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    [aLoginBtn addTarget:self action:@selector(onActive:) forControlEvents:UIControlEventTouchDown];
    
    [aLoginBtn setFrame:CGRectMake(LoginBtnL, LoginBtnT,LoginBtnW,LoginBtnH)];
    [self.view addSubview:aLoginBtn];
}

// 登录按钮点击事件逻辑
- (void)onLoginBtnClicked:(UIButton *)sender {
    NSLog(@"clicked!");

    // 验证
    // if([PassWordInput.text isEqualToString:@""]){
    if(/* DISABLES CODE */ (1)){
        NSLog(@"correct!");
    }
    else{
        //弹出错误提示
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"密码错误!" preferredStyle:  UIAlertControllerStyleAlert];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }]];        
        [self presentViewController:alert animated:true completion:nil];
        
    }
    
    // 按钮恢复颜色
    sender.backgroundColor = [UIColor colorWithRed:0.02 green:0.75 blue:0.01 alpha:1.00];

}

// 按钮ACTIVE态
- (void)onActive:(UIButton *)sender{
    sender.backgroundColor = [UIColor colorWithRed:0.02 green:0.75 blue:0.01 alpha:0.80];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

@end
