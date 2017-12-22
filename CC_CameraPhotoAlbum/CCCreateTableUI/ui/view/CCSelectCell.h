//
//  CCSelectCell.h
//  CC_CameraPhotoAlbum
//
//  Created by CC on 2017/12/21.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "CCBaseTableCell.h"

@interface CCSelectCell : CCBaseTableCell
@property (nonatomic,copy) void (^selectedAction)(NSInteger value,NSIndexPath *index);

/**
 从左往右 按钮顺序 title
 */
@property (nonatomic,copy) NSArray *btnTitles;

@end
