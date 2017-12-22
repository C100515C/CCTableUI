//
//  CCArrowCell.h
//  CC_CameraPhotoAlbum
//
//  Created by CC on 2017/12/21.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "CCBaseTableCell.h"

@interface CCArrowCell : CCBaseTableCell

@property (nonatomic,copy) void (^selectedAction)(NSInteger value,NSIndexPath *index);

/**
 隐藏 箭头标题  默认 隐藏
 */
@property (nonatomic,assign) BOOL hideArrowTitle;
@end
