//
//  CCBaseTableCell.h
//  CC_CameraPhotoAlbum
//
//  Created by CC on 2017/12/21.
//  Copyright © 2017年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCTable.h"

@interface CCBaseTableCell : UITableViewCell

/**
 左侧 title
 */
@property (nonatomic,strong) UILabel *title;

@property (nonatomic,weak) NSIndexPath *currentIndex;

/**
 cell 自定义初始化

 @param identifier identifier description
 @return return value description
 */
-(CCBaseTableCell*)initWith:(NSString*)identifier;

/**
 cell 赋值操作 （子类重写）

 @param model model description数据模型
 */
-(void)setCellWith:(id)model;

@end
