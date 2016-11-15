//
//  MomentViewController.m
//  WXmoment
//
//  Created by JeffMa on 2016/10/24.
//  Copyright © 2016年 DW. All rights reserved.
//

#import "MomentViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "WXmomentModel.h"
#import "ModelGroup.h"
#import "WXmomentCell.h"

static NSString*IDD = @"AA";
const int HEADERHEIGHT = 284; // header 的高度

@interface MomentViewController ()<UITableViewDataSource,UITableViewDelegate>
/**
 *  数据源
 */
@property(nonatomic,strong)NSMutableArray * dataArray;
/**
 *  数据源对应cell高度
 */
@property(nonatomic,strong)NSMutableArray * frameArray;
/**
 *  tableView
 */
@property(nonatomic,weak)UITableView * tab;

// header 部分
@property (nonatomic,strong) UITableView *TableView;
@property (nonatomic,strong) UIView *HeaderView;
@property (nonatomic,strong) UIImageView *HeaderBackgroundImageView;
@property (nonatomic,strong) UIImageView *HeaderAvatarImageView;
@property (nonatomic,strong) UILabel *HeaderNameLabel;

@end

@implementation MomentViewController

// 获取数据源（模型数据源、模型高度数据源）
-(NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [ModelGroup groupWithNameOfContent:@"data.plist"];
        _frameArray = [WXmomentFrameModel frameModelWithArray:_dataArray];
    }
    return _dataArray;
}

#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"水友圈"; // 标题栏
    
    [self addTabelView];
    [self addTableViewHeader];
    
}

// 创建tableView
-(void)addTabelView{
    // UITableViewStyleGrouped 表示viewForHeaderInSection 头部跟随一起滚动, UITableViewStylePlain 则固定
    self.TableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    self.TableView.delegate = self;
    self.TableView.dataSource = self;
    
    [self.view addSubview:self.TableView];
    [self.TableView registerClass:[WXmomentCell class] forCellReuseIdentifier:IDD];
    // 去除分割线
    // vi.separatorColor = [UIColor clearColor];
    // vi.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 设置 tableview 的背景色
    self.TableView.backgroundView = nil;
    self.TableView.backgroundColor = [UIColor whiteColor];
    
    self.tab = self.TableView;
}

// 增加 TableViewHeader
- (void) addTableViewHeader {
    self.HeaderView = [[UIView alloc] init];
    self.HeaderBackgroundImageView = [[UIImageView alloc] init]; // 背景图
    self.HeaderAvatarImageView = [[UIImageView alloc] init]; // 头像
    self.HeaderNameLabel = [[UILabel alloc] init]; // 微信昵称
    
    // 包裹元素
    self.HeaderView.backgroundColor = [UIColor whiteColor];
    
    // 背景图
    [self.HeaderBackgroundImageView setImage:[UIImage imageNamed:@"header_bg"]];
    //[self.HeaderBackgroundImageView setContentMode:UIViewContentModeScaleAspectFill]; // 设置后会破坏高度
    
    // 头像
    [self.HeaderAvatarImageView setImage:[UIImage imageNamed:@"avatar"]];
    [self.HeaderAvatarImageView.layer setBorderWidth:0.5];
    self.HeaderAvatarImageView.layer.borderColor = [[UIColor colorWithWhite:0.6 alpha:1] CGColor];
    
    // 昵称
    self.HeaderNameLabel.text = @"JeffMa";
    self.HeaderNameLabel.textColor=[UIColor whiteColor];
    [self.HeaderNameLabel setFont:[UIFont boldSystemFontOfSize:14]]; // 加粗
    self.HeaderNameLabel.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.4]; // 阴影
    self.HeaderNameLabel.shadowOffset = CGSizeMake(1, 1);// 阴影偏移
    
    // 增加
    self.TableView.tableHeaderView = self.HeaderView;
    [self.HeaderView addSubview:self.HeaderBackgroundImageView];
    [self.HeaderView addSubview:self.HeaderAvatarImageView];
    [self.HeaderView addSubview:self.HeaderNameLabel];
}

#pragma mark - numberOfSectionsInTableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

// cell 定义
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WXmomentCell*cell = [tableView dequeueReusableCellWithIdentifier:IDD ];
    
    cell.model = [_dataArray objectAtIndex:indexPath.row];
    cell.frameModel = [_frameArray objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone; // 去除点击灰色效果
    
    return cell;
}

#pragma mark - numberOfRowsInSection
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

#pragma mark - heightForRowAtIndexPath
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    WXmomentFrameModel*mo = [_frameArray objectAtIndex:indexPath.row];
    return mo.cellHeight;
}

// 估计高度，提高性能
#pragma mark - estimatedHeightForRowAtIndexPath
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

// 分割线样式设置
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 去掉分割线默认的 margin left
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)])
    {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
    // 删除最后一条分割线
    if ( indexPath.row ==  self.dataArray.count - 1 ) {
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, CGRectGetWidth(tableView.bounds));
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    // hack 横竖屏
    [self.TableView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.HeaderView setFrame:CGRectMake(0, 0, self.view.frame.size.width, HEADERHEIGHT)];
    [self.HeaderBackgroundImageView setFrame:CGRectMake(0, 0, self.view.frame.size.width, HEADERHEIGHT - 24)];
    [self.HeaderAvatarImageView setFrame:CGRectMake(self.HeaderView.frame.size.width-90, 214, 70, 70)];
    [self.HeaderNameLabel setFrame:CGRectMake(self.HeaderView.frame.size.width-150, 230, 60, 20)];

}

@end
