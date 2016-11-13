//
//  WXmomentFrameModel.m
//  WXmoment
//
//  Created by JeffMa on 2016/10/26.
//  Copyright © 2016年 DW. All rights reserved.
//

#import "WXmomentFrameModel.h"
const int CELLMARGIN = 10; // cell margin

#define WXmomenNameFont [UIFont systemFontOfSize:13]
#define WXmomenTextFont [UIFont systemFontOfSize:12]
#define WXmomenTimeFont [UIFont systemFontOfSize:10]


@implementation WXmomentFrameModel

+ (instancetype)frameModelWithModel:(WXmomentModel *)model{
    return [[self alloc] initWithModel:model];
}

+(NSMutableArray *)frameModelWithArray:(NSMutableArray *)arr{
    NSMutableArray*data = [NSMutableArray array];
    for (WXmomentModel*mo in arr) {
        WXmomentFrameModel*newM =  [self frameModelWithModel:mo];
        [data addObject:newM];
    }
    return data;
}

- (instancetype)initWithModel:(WXmomentModel*)model{
    if (self = [super init]) {
        self.model = model;
    }
    return self;
}

// 单个 Cell 的布局，并最终得到单个 Cell 的高度
-(CGFloat)cellHeight{
    if (_cellHeight == 0) {
        
        // 头像
        CGFloat avatarX = CELLMARGIN;
        CGFloat avatarY = CELLMARGIN;
        CGFloat avatarWH = 40;
        self.avatarFrame = CGRectMake(avatarX, avatarY, avatarWH, avatarWH);
        
        // 昵称
        CGFloat nameY = avatarY;
        CGFloat nameX = CGRectGetMaxX(self.avatarFrame) + 7;
        // 计算昵称文字所占据的尺寸
        NSDictionary *nameAttrs = @{NSFontAttributeName : WXmomenNameFont};
        CGSize nameSize = [self.model.name sizeWithAttributes:nameAttrs];
        self.nameFrame = (CGRect){{nameX, nameY}, nameSize};
        
        // 文本内容
        CGFloat textX = nameX;
        CGFloat textY = avatarWH/2 + CELLMARGIN+ CELLMARGIN/3;
        CGFloat textW = [UIScreen mainScreen].bounds.size.width - CELLMARGIN - textX;
        CGSize textMaxSize = CGSizeMake(textW, MAXFLOAT);
        NSDictionary *textAttrs = @{NSFontAttributeName : WXmomenTextFont};
        CGFloat textH = [self.model.text boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAttrs context:nil].size.height;
        self.textFrame = CGRectMake(textX, textY, textW, textH);
        
        // 贴图
        if (self.model.picture) {
            CGFloat pictureW = 200;
            CGFloat pictureH = 140;
            
            CGFloat pictureX = textX;
            CGFloat pictureY = CGRectGetMaxY(self.textFrame) + CELLMARGIN;
            self.pictureFrame = CGRectMake(pictureX, pictureY, pictureW, pictureH);
            
            _cellHeight = CGRectGetMaxY(self.pictureFrame);
        } else {
            _cellHeight = CGRectGetMaxY(self.textFrame);
        }
        _cellHeight += CELLMARGIN;
        
        // 点赞图标
        CGFloat iconW = 18;
        CGFloat iconH = 12;
        CGFloat iconY = _cellHeight;
        CGFloat iconX = [UIScreen mainScreen].bounds.size.width - CELLMARGIN -iconW;
        self.iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
        _cellHeight += CELLMARGIN + iconH;
        
        
        // 时间(xxx 前)
        CGFloat timeY = iconY - 3;
        CGFloat timeX = nameX;
        // 计算时间文字所占据的尺寸
        NSDictionary *timeAttrs = @{NSFontAttributeName : WXmomenTimeFont};
        CGSize timeSize = [self.model.time sizeWithAttributes:timeAttrs];
        self.timeFrame = (CGRect){{timeX, timeY}, timeSize};
        
    }
    NSLog(@"Cell 高度： %.2f",_cellHeight);
    return _cellHeight;
}

@end
