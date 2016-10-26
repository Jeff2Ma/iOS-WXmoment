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
//    [self addHeader];
    
//    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300) style:UITableViewStyleGrouped];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 该函数暂时作废
- (void) addHeader {
    self.aHeaderView = [[UIView alloc] init];
    self.aHeaderImg = [[UIImageView alloc] init]; // 背景图
    self.aHeaderAvatar = [[UIImageView alloc] init]; // 头像
    self.aheaderName = [[UILabel alloc] init]; // 微信昵称
    
    // 包裹元素
    [self.aHeaderView setFrame:CGRectMake(0, 64, self.view.frame.size.width, 284)];
    self.aHeaderView.backgroundColor = [UIColor whiteColor];
    
    // 背景图
    [self.aHeaderImg setFrame:CGRectMake(0, 0, self.view.frame.size.width, 260)];
    [self.aHeaderImg setImage:[UIImage imageNamed:@"header_bg"]];
    
    // 头像
    [self.aHeaderAvatar setFrame:CGRectMake(self.aHeaderView.frame.size.width-90, 214, 70, 70)];
    [self.aHeaderAvatar setImage:[UIImage imageNamed:@"avatar"]];
    [self.aHeaderAvatar.layer setBorderWidth:0.5];
    self.aHeaderAvatar.layer.borderColor = [[UIColor colorWithWhite:0.6 alpha:1] CGColor];
    
    // 昵称
    [self.aheaderName setFrame:CGRectMake(self.aHeaderView.frame.size.width-150, 230, 60, 20)];
    self.aheaderName.text = @"JeffMa";
    self.aheaderName.textColor=[UIColor whiteColor];
    [self.aheaderName setFont:[UIFont boldSystemFontOfSize:14]]; // 加粗
    self.aheaderName.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.4]; // 阴影
    self.aheaderName.shadowOffset = CGSizeMake(1, 1);// 阴影偏移

    [self.tableView addSubview:self.aHeaderView];
    [self.aHeaderView addSubview:self.aHeaderImg];
    [self.aHeaderView addSubview:self.aHeaderAvatar];
    [self.aHeaderView addSubview:self.aheaderName];
}


// header 的高度
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 284;
}

//  table view 添加自定义头部
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    self.aHeaderView = [[UIView alloc] init];
    self.aHeaderImg = [[UIImageView alloc] init]; // 背景图
    self.aHeaderAvatar = [[UIImageView alloc] init]; // 头像
    self.aheaderName = [[UILabel alloc] init]; // 微信昵称
    
    // 包裹元素
    [self.aHeaderView setFrame:CGRectMake(0, 64, self.view.frame.size.width, 284)];
    self.aHeaderView.backgroundColor = [UIColor whiteColor];
    
    // 背景图
    [self.aHeaderImg setFrame:CGRectMake(0, 0, self.view.frame.size.width, 260)];
    [self.aHeaderImg setImage:[UIImage imageNamed:@"header_bg"]];
    
    // 头像
    [self.aHeaderAvatar setFrame:CGRectMake(self.aHeaderView.frame.size.width-90, 214, 70, 70)];
    [self.aHeaderAvatar setImage:[UIImage imageNamed:@"avatar"]];
    [self.aHeaderAvatar.layer setBorderWidth:0.5];
    self.aHeaderAvatar.layer.borderColor = [[UIColor colorWithWhite:0.6 alpha:1] CGColor];
    
    // 昵称
    [self.aheaderName setFrame:CGRectMake(self.aHeaderView.frame.size.width-150, 230, 60, 20)];
    self.aheaderName.text = @"JeffMa";
    self.aheaderName.textColor=[UIColor whiteColor];
    [self.aheaderName setFont:[UIFont boldSystemFontOfSize:14]]; // 加粗
    self.aheaderName.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.4]; // 阴影
    self.aheaderName.shadowOffset = CGSizeMake(1, 1);// 阴影偏移
    
    [self.view addSubview:self.aHeaderView];
    [self.aHeaderView addSubview:self.aHeaderImg];
    [self.aHeaderView addSubview:self.aHeaderAvatar];
    [self.aHeaderView addSubview:self.aheaderName];
    
    return self.aHeaderView;
}

// 解决TableView左边有空隙
// ref: https://zhongdian.gitbooks.io/z-s-dev-manuscript/content/ios/tableview_left_line_distance.html
-(void)viewDidLayoutSubviews
{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

//解决TableView左边有空隙
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
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