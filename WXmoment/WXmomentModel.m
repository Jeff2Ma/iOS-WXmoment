//
//  WXmomentModel.m
//  WXmoment
//
//  Created by JeffMa on 2016/10/26.
//  Copyright © 2016年 DW. All rights reserved.
//

#import "WXmomentModel.h"

@implementation WXmomentModel

+ (instancetype)modelWithDict:(NSDictionary *)dict{
    WXmomentModel*vi = [[WXmomentModel alloc] init];
    [vi setValuesForKeysWithDictionary:dict];
    return vi;
}
@end
