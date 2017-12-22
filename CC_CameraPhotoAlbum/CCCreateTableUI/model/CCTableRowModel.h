//
//  CCTableRowModel.h
//  CC_CameraPhotoAlbum
//
//  Created by CC on 2017/12/20.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "CCBaseModel.h"

@interface CCTableRowModel : CCBaseModel

/**
 cell 类型  0输入 1圆点选择 2下一个选择
 */
@property (nonatomic,copy) NSString *type;

@property (nonatomic,copy) NSString *height;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *placeholder;
@property (nonatomic,copy) NSString *keboardType;

@property (nonatomic,copy) NSArray *selectTitles;
/**
 输入 的内容
 */
@property (nonatomic,copy) NSString *content;

/**
 上传接口参数字段名
 */
@property (nonatomic,copy) NSString *ccKey;

/**
 cell 类型 2时，可以点击选择   arrow =1 可选   arrow=0 不可选
 */
@property (nonatomic,copy) NSString *arrow;

/**
 cell 类型 1时，是否选中  selected =1 选中   selected=0 不选中
 */
@property (nonatomic,copy) NSString *selected;

@end
