//
//  CCManager.h
//  CC_CameraPhotoAlbum
//
//  Created by CC on 2017/12/22.
//  Copyright © 2017年 cc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCViewManager.h"
#import "CCModelManager.h"

@interface CCManager : NSObject
@property (nonatomic,strong) CCViewManager *viewManager;
@property (nonatomic,strong) CCModelManager *modelManager;


/**
 设置cell

 @param index index description
 @param cell cell description
 */
-(void)setCellWith:(NSIndexPath*)index andCell:(CCBaseTableCell*)cell;

/**
 设置 组头

 @param section section description
 @param table table description
 @return return value description
 */
-(UIView *)setHeaderWith:(NSInteger)section andTable:(UITableView*)table;


/**
 设置 组尾

 @param section section description
 @param table table description
 @return return value description   
 */
-(UIView *)setFooterWith:(NSInteger)section andTable:(UITableView*)table;


/**
 获取 所有要的 值和接口参数字段 对应字典

 @return return value description
 */
-(NSDictionary*)getParamDic;

@end
