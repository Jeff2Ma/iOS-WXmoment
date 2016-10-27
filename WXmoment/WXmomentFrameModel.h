//
//  WXmomentFrameModel.h
//  WXmoment
//
//  Created by JeffMa on 2016/10/26.
//  Copyright © 2016年 DW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WXmomentModel.h"
@interface WXmomentFrameModel : NSObject

// avatarFrame
@property(nonatomic,assign)CGRect avatarFrame;

// nameFrame
@property(nonatomic,assign)CGRect nameFrame;

// textFrame
@property(nonatomic,assign)CGRect textFrame;

// pictureFrame
@property(nonatomic,assign)CGRect pictureFrame;

// timeFrame
@property(nonatomic,assign)CGRect timeFrame;

// iconFrame
@property(nonatomic,assign)CGRect iconFrame;

// cellHeight
@property(nonatomic,assign)CGFloat cellHeight;

// model
@property(nonatomic,strong)WXmomentModel * model;

// 模型数组转frameModel数组的初始化方法
+ (NSMutableArray*)frameModelWithArray:(NSMutableArray*)arr;

// 单个实例的初始化方法
+ (instancetype)frameModelWithModel:(WXmomentModel*)model;
@end