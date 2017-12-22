//
//  CCTableGroupModel.h
//  CC_CameraPhotoAlbum
//
//  Created by CC on 2017/12/20.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "CCBaseModel.h"
#import "CCTableRowModel.h"

@interface CCTableGroupModel : CCBaseModel

@property (nonatomic,copy) NSString *groupFooterTitle;//":"",
@property (nonatomic,copy) NSString *groupFooterHeight;//":0,

@property (nonatomic,copy) NSString *groupHeaderHeight;//":30,
@property (nonatomic,copy) NSString *groupHeaderTitle;//":"请填写个人信息（必填）",

/**
 组 行数数据
 */
@property (nonatomic,strong) NSMutableArray <CCTableRowModel *>*groupRows;

+(Class)groupRows_class;

@end
