//
//  ModelGroup.m
//  WXmoment
//
//  Created by JeffMa on 2016/10/26.
//  Copyright © 2016年 DW. All rights reserved.
//

#import "ModelGroup.h"

@implementation ModelGroup
+ (NSMutableArray *)groupWithNameOfContent:(NSString *)name{
    NSMutableArray*dataArr = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray*arr     = [ NSMutableArray arrayWithContentsOfFile:[[NSBundle mainBundle]
                                                                       pathForResource:name
                                                                       ofType:nil]];
    for (NSDictionary*dic  in arr) {
        WXmomentModel*mo = [WXmomentModel modelWithDict:dic];
        [dataArr addObject: mo];
    }
    
    return dataArr;
}
@end

