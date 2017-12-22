//
//  CCTableModel.h
//  CC_CameraPhotoAlbum
//
//  Created by CC on 2017/12/20.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "CCBaseModel.h"
#import "CCTableGroupModel.h"
#import "CCTableInforModel.h"

@interface CCTableModel : CCBaseModel

/**
 列表信息 model
 */
@property (nonatomic,strong) CCTableInforModel *tableInfor;

/**
 列表组数据
 */
@property (nonatomic,strong) NSMutableArray <CCTableGroupModel *>*tableGroupArr;

+(Class)tableInfor_class;
+(Class)tableGroupArr_class;

@end
