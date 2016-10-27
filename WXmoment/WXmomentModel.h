//
//  WXmomentModel.h
//  WXmoment
//
//  Created by JeffMa on 2016/10/26.
//  Copyright © 2016年 DW. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface WXmomentModel : NSObject

@property(nonatomic,strong)NSString * avatar;

@property(nonatomic,strong)NSString * name;

@property(nonatomic,strong)NSString * text;

@property(nonatomic,strong)NSString * picture;

@property(nonatomic,strong)NSString * time;

@property(nonatomic,strong)NSString * icon;

// 初始化方法
+ (instancetype)modelWithDict:(NSDictionary*)dict;
@end