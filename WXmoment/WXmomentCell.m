//
//  WXmomentCell.m
//  WXmoment
//
//  Created by JeffMa on 2016/10/26.
//  Copyright © 2016年 DW. All rights reserved.
//

#import "WXmomentCell.h"
#import "WXmomentCell.h"
#define WXmomenNameFont [UIFont systemFontOfSize:13]
#define WXmomenTextFont [UIFont systemFontOfSize:12]
#define WXmomenTimeFont [UIFont systemFontOfSize:10]
@interface WXmomentCell()

// 头像
@property (nonatomic, weak) UIImageView *avatarImageView;

// 昵称
@property (nonatomic, weak) UILabel *nameLabel;

// 文本内容
@property (nonatomic, weak) UILabel *textlabel;

// 贴图
@property (nonatomic, weak) UIImageView *pictureImageView;

// 时间
@property (nonatomic, weak) UILabel *timeLabel;

// 点赞图标
@property (nonatomic, weak) UIImageView *iconImageView;

@end


@implementation WXmomentCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

// 样式
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        NSLog(@"%s",__func__);
        
        // 头像
        UIImageView *avatarImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:avatarImageView];
        self.avatarImageView = avatarImageView;
        
        // 昵称
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.textColor = [UIColor colorWithRed:0.36 green:0.42 blue:0.57 alpha:1.00];
        nameLabel.font = WXmomenNameFont;
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        // 文本内容
        UILabel *textlabel = [[UILabel alloc] init];
        textlabel.numberOfLines = 0;
        textlabel.font = WXmomenTextFont;
        [self.contentView addSubview:textlabel];
        self.textlabel = textlabel;
        
        // 贴图
        UIImageView *pictureImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:pictureImageView];
        self.pictureImageView = pictureImageView;
        [self.pictureImageView setContentMode:UIViewContentModeScaleAspectFit];
        
        // 时间
        UILabel *timeLabel = [[UILabel alloc] init];
        timeLabel.textColor = [UIColor colorWithRed:0.52 green:0.52 blue:0.52 alpha:1.00];
        timeLabel.font = WXmomenTimeFont;
        [self.contentView addSubview:timeLabel];
        self.timeLabel = timeLabel;
        
        // 点赞图标
        UIImageView *iconImageView = [[UIImageView alloc] init];
        iconImageView.image = [UIImage imageNamed:@"icon"];
        iconImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:iconImageView];
        self.iconImageView = iconImageView;
    }
    return  self;
}

// 给控件赋frame值
-(void)layoutSubviews{
    [super layoutSubviews];
    _avatarImageView.frame = _frameModel.avatarFrame;
    _nameLabel.frame = _frameModel.nameFrame;
    _textlabel.frame = _frameModel.textFrame;
    _pictureImageView.frame = _frameModel.pictureFrame;
    _iconImageView.frame = _frameModel.iconFrame;
    _timeLabel.frame = _frameModel.timeFrame;
}

// 控件赋数据值
-(void)setModel:(WXmomentModel *)model{
    _model = model;
    _avatarImageView.image = [UIImage imageNamed:model.avatar];
    _nameLabel.text = _model.name;
    _textlabel.text = _model.text;
    if (model.picture) {
        _pictureImageView.image = [UIImage imageNamed:model.picture];
    }
    _timeLabel.text = _model.time;
    
}
@end

