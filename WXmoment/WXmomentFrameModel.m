//
//  WXmomentFrameModel.m
//  WXmoment
//
//  Created by JeffMa on 2016/10/26.
//  Copyright © 2016年 DW. All rights reserved.
//

#import "WXmomentFrameModel.h"

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
        
        // 公共 margin 值
        CGFloat margin = 10;
        
        // 头像
        CGFloat avatarX = margin;
        CGFloat avatarY = margin;
        CGFloat avatarWH = 40;
        self.avatarFrame = CGRectMake(avatarX, avatarY, avatarWH, avatarWH);
        
        // 昵称
        CGFloat nameY = avatarY;
        CGFloat nameX = CGRectGetMaxX(self.avatarFrame) + 7;
        // 计算昵称文字所占据的尺寸
        NSDictionary *nameAttrs = @{NSFontAttributeName : [UIFont systemFontOfSize:17]};
        CGSize nameSize = [self.model.name sizeWithAttributes:nameAttrs];
        self.nameFrame = (CGRect){{nameX, nameY}, nameSize};
        
        // 文本内容
        CGFloat textX = nameX;
        CGFloat textY = avatarWH/2 + margin+ margin/3;
        CGFloat textW = [UIScreen mainScreen].bounds.size.width - margin - textX;
        CGSize textMaxSize = CGSizeMake(textW, MAXFLOAT);
        NSDictionary *textAttrs = @{NSFontAttributeName : [UIFont systemFontOfSize:14]};
        CGFloat textH = [self.model.text boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAttrs context:nil].size.height;
        self.textFrame = CGRectMake(textX, textY, textW, textH);
        
        // 贴图
        if (self.model.picture) {
            CGFloat pictureW = 200;
            CGFloat pictureH = 140;
            
            CGFloat pictureX = textX;
            CGFloat pictureY = CGRectGetMaxY(self.textFrame) + margin;
            self.pictureFrame = CGRectMake(pictureX, pictureY, pictureW, pictureH);
            
            _cellHeight = CGRectGetMaxY(self.pictureFrame);
        } else {
            _cellHeight = CGRectGetMaxY(self.textFrame);
        }
        _cellHeight += margin;
        
        // 点赞图标
        CGFloat iconW = 14; //TODO 不知道为啥没作用
        CGFloat iconH = 10; //TODO 不知道为啥没作用
        CGFloat iconY = _cellHeight;
        CGFloat iconX = [UIScreen mainScreen].bounds.size.width - margin -iconW;
        self.iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
        _cellHeight += margin + iconH;
        
        
        // 时间(xxx 前)
        CGFloat timeY = iconY - iconH/2;
        CGFloat timeX = nameX;
        // 计算时间文字所占据的尺寸
        NSDictionary *timeAttrs = @{NSFontAttributeName : [UIFont systemFontOfSize:14]};
        CGSize timeSize = [self.model.time sizeWithAttributes:timeAttrs];
        self.timeFrame = (CGRect){{timeX, timeY}, timeSize};
        
    }
    return _cellHeight;
}

@end