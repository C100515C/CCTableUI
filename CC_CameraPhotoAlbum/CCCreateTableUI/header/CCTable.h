
//
//  CCTable.h
//  CC_CameraPhotoAlbum
//
//  Created by CC on 2017/12/21.
//  Copyright © 2017年 cc. All rights reserved.
//

#ifndef CCTable_h
#define CCTable_h
//cell  类型
typedef NS_ENUM(NSInteger,CC_cell_type){
    CC_cell_input =0,//输入框的
    CC_cell_select,//圆点 选择
    CC_cell_arrow //箭头 选择
};

//cell  标识
static NSString *const CCInputCellID = @"CCInputCellID";
static NSString *const CCSelectCellID = @"CCSelectCellID";
static NSString *const CCArrowCellID = @"CCArrowCellID";

//文件引入
#import "Masonry.h"
#import "MacroHeader.h"

#endif /* CCTable_h */
