//
//  WXmomentCell.h
//  WXmoment
//
//  Created by JeffMa on 2016/10/26.
//  Copyright © 2016年 DW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WXmomentModel.h"
#import "WXmomentFrameModel.h"
@interface WXmomentCell : UITableViewCell


/**
 *  model
 */
@property(nonatomic,strong)WXmomentModel * model;
/**
 *  frameModel
 */
@property(nonatomic,strong)WXmomentFrameModel * frameModel;
@end

