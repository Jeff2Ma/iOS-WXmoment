//
//  MomentViewController.h
//  WXmoment
//
//  Created by JeffMa on 2016/10/24.
//  Copyright © 2016年 DW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface MomentViewController :  UITableViewController
// header 部分
@property (nonatomic,strong) UIView *aHeaderView;
@property (nonatomic,strong) UIImageView *aHeaderImg;
@property (nonatomic,strong) UIImageView *aHeaderAvatar;
@property (nonatomic,strong) UILabel *aheaderName;



// table view 部分
@property (nonatomic,strong) NSArray *list;


@end
