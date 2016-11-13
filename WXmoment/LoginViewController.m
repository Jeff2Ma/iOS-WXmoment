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

#define LoginBound [[UIScreen mainScreen] bounds];
#define LoginNameFont [UIFont systemFontOfSize:17]
const int MARGIN = 20; // 内 margin

@interface LoginViewController ()
    @property (nonatomic,strong)  UILabel *PassWordLabel;
    @property (nonatomic,strong)  UILabel *NameLabel;
    @property (nonatomic,strong)  UIImageView *AvatarImageView;
    @property (nonatomic,strong)  UITextField *PassWordInputTextField;
    @property (nonatomic,strong)  UIButton *LoginButton;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"微信登录"; // 标题栏
    
    // Do any additional setup after loading the view, typically from a nib.
    
    CGRect bound = LoginBound; // 共有
    
    /*--------------------------------------------------------------
     # 头像
     --------------------------------------------------------------*/
    CGFloat avatarW = 80;
    CGFloat avatarH = 80;
    CGFloat avatarX = bound.size.width/2 - avatarW/2;
    CGFloat avatarY = 100;
    
    self.AvatarImageView = [[UIImageView alloc]initWithFrame:CGRectMake(avatarX,avatarY,avatarW,avatarH)];
    [self.AvatarImageView setImage:[UIImage imageNamed:@"avatar"]];
    [self.AvatarImageView setContentMode:UIViewContentModeScaleAspectFill]; // 图片显示方式，类似 CSS 中 cover
    
    [self.AvatarImageView.layer setBorderWidth:1];
    self.AvatarImageView.layer.cornerRadius = 5;
    self.AvatarImageView.layer.borderColor = [[UIColor colorWithRed:226/255.0 green:230/255.0 blue:232/255.0 alpha:1] CGColor];
    
    [self.view addSubview:self.AvatarImageView];
    
    /*--------------------------------------------------------------
     # 微信号
     --------------------------------------------------------------*/
    self.NameLabel = [[UILabel alloc]init];
    self.NameLabel.numberOfLines = 0;
    self.NameLabel.textColor = [UIColor grayColor];
    self.NameLabel.backgroundColor = [UIColor clearColor];
    self.NameLabel.textAlignment = NSTextAlignmentCenter; // 文本对齐方式
    self.NameLabel.font = LoginNameFont;
    
    /* 通过计算文本的尺寸来定位
     * 定位方法：http://blog.csdn.net/enuola/article/details/8559588
     * 修正过时的函数：http://blog.csdn.net/jymn_chen/article/details/10949279
     * 修复参考：http://wahenzan.com/a/mdev/ios/2016/1011/10890.html
     */
    
    NSString *strName = @"Jeff2Ma";
    
    // old way
    // CGSize nameSize = [strName sizeWithFont:NameLabel.font constrainedToSize:CGSizeMake(MAXFLOAT, NameLabel.frame.size.height)];
    
    // new way
    NSDictionary *attribute = @{NSFontAttributeName:LoginNameFont};
    CGSize nameSize = [strName boundingRectWithSize:CGSizeMake(1000, 20) options: NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    // 基本单位
    CGFloat NameX = bound.size.width/2 - nameSize.width/2;
    CGFloat NameY = avatarY + 45; //145
    
    // 根据 name 的长度重新设置位置
    [self.NameLabel setFrame:CGRectMake(NameX, NameY, nameSize.width, 120)];
    
    self.NameLabel.text = strName;
    
    [self.view addSubview:self.NameLabel];

    /*--------------------------------------------------------------
     # 密码区域
     --------------------------------------------------------------*/
    CGFloat PassWordLabelW = 38;
    CGFloat PassWordLabelH = 34;
    CGFloat PassWordLabelX = MARGIN;
    CGFloat PassWordLabelY = NameY + 115; //260
    
    self.PassWordLabel = [[UILabel alloc]init];
    self.PassWordLabel.text = @"密码";
    self.PassWordLabel.textColor=[UIColor blackColor];
    
    [self.PassWordLabel setFrame:CGRectMake(PassWordLabelX,PassWordLabelY,PassWordLabelW,PassWordLabelH)];
    [self.view addSubview:self.PassWordLabel];
    
    /*--------------------------------------------------------------
     # 密码输入框
     --------------------------------------------------------------*/
    CGFloat PassWordInputH = 34;
    CGFloat PassWordInputW = bound.size.width - MARGIN * 2 - PassWordInputH - MARGIN/2;
    CGFloat PassWordInputX = MARGIN + PassWordInputH + MARGIN/2;
    CGFloat PassWordInputY = PassWordLabelY;
    
    self.PassWordInputTextField = [[UITextField alloc]init];
    self.PassWordInputTextField.placeholder = @"请填写密码";
    self.PassWordInputTextField.textColor=[UIColor blackColor];
    self.PassWordInputTextField.secureTextEntry = YES; // 密码形式的输入
    self.PassWordInputTextField.keyboardType = UIKeyboardTypeASCIICapable; //ASCLL 码键盘
    [self.PassWordInputTextField setFrame:CGRectMake(PassWordInputX,PassWordInputY,PassWordInputW,PassWordInputH)];
    
    // 设置下边框
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(0.0f, self.PassWordInputTextField.frame.size.height - 1, self.PassWordInputTextField.frame.size.width, 1.0f);
    bottomBorder.backgroundColor = [UIColor colorWithRed:226/255.0 green:230/255.0 blue:232/255.0 alpha:1].CGColor;
    [self.PassWordInputTextField.layer addSublayer:bottomBorder];
    
    [self.view addSubview:self.PassWordInputTextField];

    /*--------------------------------------------------------------
     # 登录按钮
     --------------------------------------------------------------*/
    CGFloat LoginBtnW = bound.size.width - MARGIN * 2;
    CGFloat LoginBtnH = 36;
    CGFloat LoginBtnX = MARGIN;
    CGFloat LoginBtnY = 330;
    
    self.LoginButton = [[UIButton alloc] init];
    [self.LoginButton setTitle:@"登 录" forState:UIControlStateNormal];
    self.LoginButton.layer.cornerRadius = 5; // 圆角
    self.LoginButton.backgroundColor = [UIColor colorWithRed:0.02 green:0.75 blue:0.01 alpha:1.00];
    [self.LoginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.LoginButton setTitleColor:[UIColor colorWithRed:0.60 green:0.89 blue:0.59 alpha:1.00] forState:UIControlStateHighlighted];
    
    // 事件绑定
    [self.LoginButton addTarget:self action:@selector(onLoginBtnClickedFunction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.LoginButton addTarget:self action:@selector(onLoginBtnClickedStyle:) forControlEvents:UIControlEventTouchDown];
    
    [self.LoginButton setFrame:CGRectMake(LoginBtnX, LoginBtnY,LoginBtnW,LoginBtnH)];
    [self.view addSubview:self.LoginButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Logic: 登录按钮点击事件逻辑
#pragma mark - onLoginBtnClickedFunction
- (void)onLoginBtnClickedFunction:(UIButton *)sender {
    NSLog(@"clicked!");
    
    // 验证
    if([self.PassWordInputTextField.text isEqualToString:@""]){
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
