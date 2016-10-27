//
//  MomentViewController.h
//  WXmoment
//
//  Created by JeffMa on 2016/10/24.
//  Copyright © 2016年 DW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface MomentViewController :  UIViewController
// header 部分
@property (nonatomic,strong) UITableView *aTableView;
@property (nonatomic,strong) UIView *aHeaderView;
@property (nonatomic,strong) UIImageView *aHeaderImg;
@property (nonatomic,strong) UIImageView *aHeaderAvatar;
@property (nonatomic,strong) UILabel *aheaderName;

@end
