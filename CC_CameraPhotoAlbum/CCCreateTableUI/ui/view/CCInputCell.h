//
//  CCInputCell.h
//  CC_CameraPhotoAlbum
//
//  Created by CC on 2017/12/21.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "CCBaseTableCell.h"

@interface CCInputCell : CCBaseTableCell

/**
 输入框
 */
@property (nonatomic,strong) UITextField *input;

@property (nonatomic,copy) void (^inputBlock)(NSString *text,NSIndexPath *index);

@end
