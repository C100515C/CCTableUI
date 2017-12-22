//
//  CCViewManager.h
//  CC_CameraPhotoAlbum
//
//  Created by CC on 2017/12/21.
//  Copyright © 2017年 cc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCTable.h"
#import "CCSelectCell.h"
#import "CCArrowCell.h"
#import "CCInputCell.h"
#import "CCGroupFooter.h"
#import "CCGroupHeader.h"

@interface CCViewManager : NSObject


/**
 创建cell

 @param type cell 类型
 @param identifier cell 标示  不传 用各个cell默认的
 @param table cell 所在的table
 @return return value description
 */
-(CCBaseTableCell*)createCellWith:(CC_cell_type)type andIdentifier:(NSString*)identifier andTable:(UITableView*)table;


/**
 创建 header

 @param identifier identifier description
 @return return value description
 */
-(CCGroupHeader*)createHeaderWith:(NSString *)identifier andTable:(UITableView*)table;


/**
 创建footer

 @param identifier identifier description
 @return return value description
 */
-(CCGroupFooter*)createFooterWith:(NSString *)identifier andTable:(UITableView*)table;

@end
