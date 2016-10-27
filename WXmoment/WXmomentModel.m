//
//  WXmomentModel.m
//  WXmoment
//
//  Created by JeffMa on 2016/10/26.
//  Copyright © 2016年 DW. All rights reserved.
//

#import "WXmomentModel.h"

@implementation WXmomentModel

// 初始化方法的实现，字典转 model
+ (instancetype)modelWithDict:(NSDictionary *)dict{
    WXmomentModel*vi = [[WXmomentModel alloc] init];
    [vi setValuesForKeysWithDictionary:dict];
    return vi;
}
@end
