//
//  CCModelManager.h
//  CC_CameraPhotoAlbum
//
//  Created by CC on 2017/12/20.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "CCBaseModel.h"
#import "CCTableModel.h"
#import "CCTable.h"

@interface CCModelManager : CCBaseModel

@property(nonatomic,strong) CCTableModel *tableModel;

/**
 获取cell 类型

 @param index index description
 @return return value description
 */
-(CC_cell_type)getCellTypeWith:(NSIndexPath*)index;

/**
 获取cell 高度

 @param index index description
 @return return value description
 */
-(CGFloat)getCellHeightWith:(NSIndexPath*)index;

/**
 获取每组 行数

 @param section section description
 @return return value description
 */
-(NSInteger)getRowsWith:(NSInteger)section;

/**
 获取每行数据model

 @param index index description
 @return return value description
 */
-(CCTableRowModel*)getRowModelWith:(NSIndexPath*)index;

/**
 获取组头 高度

 @param section section description
 @return return value description
 */
-(CGFloat)getGroupHeaderHeight:(NSInteger)section;

/**
 获取组尾高度

 @param section section description
 @return return value description
 */
-(CGFloat)getGroupFooterHeight:(NSInteger)section;

/**
 获取组头标题

 @param section section description
 @return return value description   
 */
-(NSString *)getGroupHeaderTitle:(NSInteger)section;

/**
 获取组尾标题

 @param section section description
 @return return value description
 */
-(NSString *)getGroupFooterTitle:(NSInteger)section;


/**
 获取 接口 所需参数值

 @return return value description
 */
-(NSDictionary *)getNetParam;

@end
