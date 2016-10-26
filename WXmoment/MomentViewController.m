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
@end

@implementation MomentViewController

#pragma mark - 获取数据源（模型数据源、模型高度数据源）
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
    self.navigationItem.title = @"微信朋友圈"; // 标题栏

    [self setUpTabelView];
}

#pragma mark - 创建tableView
-(void)setUpTabelView{
    // UITableViewStyleGrouped 表示头部跟随一起滚动, UITableViewStylePlain 则固定
    UITableView*vi = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];

    vi.delegate = self;
    vi.dataSource = self;
    [self.view addSubview:vi];
    [vi registerClass:[WXmomentCell class] forCellReuseIdentifier:IDD];
    // vi.separatorColor = [UIColor clearColor];
    // vi.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tab = vi;
}

#pragma mark - tableViewDelegate
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    WXmomentFrameModel*mo = [_frameArray objectAtIndex:indexPath.row];
    return mo.cellHeight;
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
    [self.aHeaderView setFrame:CGRectMake(0, 0, self.view.frame.size.width, 284)];
    self.aHeaderView.backgroundColor = [UIColor whiteColor];
    
    // 背景图
    [self.aHeaderImg setFrame:CGRectMake(0, 0, self.view.frame.size.width, 260)];
    [self.aHeaderImg setImage:[UIImage imageNamed:@"header_bg"]];
    
    // 头像
    [self.aHeaderAvatar setFrame:CGRectMake(self.aHeaderView.frame.size.width-80, 214, 70, 70)];
    [self.aHeaderAvatar setImage:[UIImage imageNamed:@"avatar"]];
    [self.aHeaderAvatar.layer setBorderWidth:0.5];
    self.aHeaderAvatar.layer.borderColor = [[UIColor colorWithWhite:0.6 alpha:1] CGColor];
    
    // 昵称
    [self.aheaderName setFrame:CGRectMake(self.aHeaderView.frame.size.width-140, 230, 60, 20)];
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


// 去掉默认边框线的margin值
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
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
    
    // 删除最后一条 border
//    if ( indexPath.row ==  self.dataArray.count ) {
//        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, CGRectGetWidth(tableView.bounds));
//    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end



/**
 
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



@end

*/