//
//  ViewController.m
//  WXmoment
//
//  Created by JeffMa on 2016/10/24.
//  Copyright © 2016年 DW. All rights reserved.
//

#import "LoginViewController.h"
#import "MomentViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"微信登录"; // 标题栏
    
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

// UI Element: 微信号
#pragma mark - addUserName
-(void)addUserName{
    self.aName = [[UILabel alloc]init];
    self.aName.numberOfLines = 0;
    self.aName.textColor = [UIColor grayColor];
    self.aName.backgroundColor = [UIColor clearColor];
    self.aName.textAlignment = NSTextAlignmentCenter; // 文本对齐方式
    
    /* 通过计算文本的尺寸来定位
    * 定位方法：http://blog.csdn.net/enuola/article/details/8559588
    * 修正过时的函数：http://blog.csdn.net/jymn_chen/article/details/10949279
    * 修复参考：http://wahenzan.com/a/mdev/ios/2016/1011/10890.html
    */
    
    NSString *strName = @"Jeff2Ma "; // 必须加个空格才正常
    
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
    [self.aName setFrame:CGRectMake(NameLeft, NameTop, nameSize.width, 120)];

    self.aName.text = strName;
    
    [self.view addSubview:self.aName];
}

// UI Element: 头像
#pragma mark - addAvatar
-(void)addAvatar{
    // 图片定位
    CGRect bound = [[UIScreen mainScreen] bounds];
    CGFloat avatarWidth = 80;
    CGFloat avatarHeight = 80;
    CGFloat avatarLeft = bound.size.width/2 - avatarWidth/2;
    CGFloat avatarTop = 100;
    
    self.aAvatar = [[UIImageView alloc]initWithFrame:CGRectMake(avatarLeft,avatarTop,avatarWidth,avatarHeight)];
    [self.aAvatar setImage:[UIImage imageNamed:@"avatar"]];
    [self.aAvatar setContentMode:UIViewContentModeScaleAspectFit];
    
    [self.aAvatar.layer setBorderWidth:1];
    self.aAvatar.layer.borderColor = [[UIColor colorWithRed:226/255.0 green:230/255.0 blue:232/255.0 alpha:1] CGColor];
    
    [self.view addSubview:self.aAvatar];
}

// UI Element: 密码标签
#pragma mark - addPassWordLabel
- (void) addPassWordLabel{
    
    CGFloat PassWordLabelW = 38;
    CGFloat PassWordLabelH = 34;
    CGFloat PassWordLabelL = 20;
    CGFloat PassWordLabelT = 260;
    
    self.aPassWordLabel = [[UILabel alloc]init];
    self.aPassWordLabel.text = @"密码";
    self.aPassWordLabel.textColor=[UIColor blackColor];
    
    [self.aPassWordLabel setFrame:CGRectMake(PassWordLabelL,PassWordLabelT,PassWordLabelW,PassWordLabelH)];
    [self.view addSubview:self.aPassWordLabel];
}

// UI Element: 密码输入框
#pragma mark - addPassWordInput
- (void) addPassWordInput{
    
    CGRect bound = [[UIScreen mainScreen] bounds];
    CGFloat PassWordInputW = bound.size.width - 20*2 - 34 -10;
    CGFloat PassWordInputH = 34;
    CGFloat PassWordInputL = 20 + 34 + 10;
    CGFloat PassWordInputT = 260;
    
    self.aPassWordInput = [[UITextField alloc]init];
    self.aPassWordInput.placeholder = @"请填写密码";
    self.aPassWordInput.textColor=[UIColor blackColor];
    self.aPassWordInput.secureTextEntry = YES; // 密码形式的输入
    self.aPassWordInput.keyboardType = UIKeyboardTypeASCIICapable; //ASCLL 码键盘
    [self.aPassWordInput setFrame:CGRectMake(PassWordInputL,PassWordInputT,PassWordInputW,PassWordInputH)];
    
    // 设置下边框
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(0.0f, self.aPassWordInput.frame.size.height - 1, self.aPassWordInput.frame.size.width, 1.0f);
    bottomBorder.backgroundColor = [UIColor colorWithRed:226/255.0 green:230/255.0 blue:232/255.0 alpha:1].CGColor;
    [self.aPassWordInput.layer addSublayer:bottomBorder];
    
    [self.view addSubview:self.aPassWordInput];
}

// UI Element: 登录按钮
#pragma mark - addLoginBtn
- (void) addLoginBtn{
    
    CGRect bound = [[UIScreen mainScreen] bounds];
    CGFloat LoginBtnW = bound.size.width - 20*2;
    CGFloat LoginBtnH = 36;
    CGFloat LoginBtnL = 20;
    CGFloat LoginBtnT = 330;

    self.aLoginBtn = [[UIButton alloc] init];
    [self.aLoginBtn setTitle:@"登 录" forState:UIControlStateNormal];
    self.aLoginBtn.layer.cornerRadius = 5; // 圆角
    self.aLoginBtn.backgroundColor = [UIColor colorWithRed:0.02 green:0.75 blue:0.01 alpha:1.00];
    [self.aLoginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.aLoginBtn setTitleColor:[UIColor colorWithRed:0.60 green:0.89 blue:0.59 alpha:1.00] forState:UIControlStateHighlighted];
    
    // 事件绑定
    [self.aLoginBtn addTarget:self action:@selector(onLoginBtnClickedFunction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.aLoginBtn addTarget:self action:@selector(onLoginBtnClickedStyle:) forControlEvents:UIControlEventTouchDown];
    
    [self.aLoginBtn setFrame:CGRectMake(LoginBtnL, LoginBtnT,LoginBtnW,LoginBtnH)];
    [self.view addSubview:self.aLoginBtn];
}

// Logic: 登录按钮点击事件逻辑
#pragma mark - onLoginBtnClickedFunction
- (void)onLoginBtnClickedFunction:(UIButton *)sender {
    NSLog(@"clicked!");

    // 验证
     if([self.aPassWordInput.text isEqualToString:@""]){
        NSLog(@"correct!");
         MomentViewController *momentView = [[MomentViewController alloc] init];
         
         [self.navigationController pushViewController:momentView animated:YES];
    }
    else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"密码错误!" message:@"请输入正确的密码(为空)" preferredStyle:  UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }]];
        [self presentViewController:alert animated:true completion:nil];
        
    }
    
    // 恢复原来的状态
    sender.backgroundColor = [UIColor colorWithRed:0.02 green:0.75 blue:0.01 alpha:1.00];

}

// Logic: 按钮 active 状态颜色
#pragma mark - onLoginBtnClickedStyle
- (void)onLoginBtnClickedStyle:(UIButton *)sender{
    sender.backgroundColor = [UIColor colorWithRed:0.02 green:0.75 blue:0.01 alpha:0.80];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

@end
