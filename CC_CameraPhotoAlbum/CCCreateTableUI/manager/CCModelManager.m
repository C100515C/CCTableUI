//
//  CCModelManager.m
//  CC_CameraPhotoAlbum
//
//  Created by CC on 2017/12/20.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "CCModelManager.h"

@implementation CCModelManager

-(void)loadFile{
    NSData *jsonData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"CCUIJson" ofType:@"json"]];
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
    [self.tableModel setPropertyAndValueWith:dic];
}

-(CCTableModel*)tableModel{
    if (_tableModel==nil) {
        _tableModel = [[CCTableModel alloc] init];
        [self loadFile];
    }
    return _tableModel;
}

-(CC_cell_type)getCellTypeWith:(NSIndexPath*)index{
    CCTableGroupModel *group = self.tableModel.tableGroupArr[index.section];
    CCTableRowModel *row = group.groupRows[index.row];
    return row.type.integerValue;
}

-(CGFloat)getCellHeightWith:(NSIndexPath*)index{
    CCTableGroupModel *group = self.tableModel.tableGroupArr[index.section];
    CCTableRowModel *row = group.groupRows[index.row];
    return row.height.floatValue;
}

-(NSInteger)getRowsWith:(NSInteger)section{
    CCTableGroupModel *group = self.tableModel.tableGroupArr[section];
    return group.groupRows.count;
}

-(CCTableRowModel*)getRowModelWith:(NSIndexPath*)index{
    CCTableGroupModel *group = self.tableModel.tableGroupArr[index.section];
    CCTableRowModel *row = group.groupRows[index.row];
    return row;
}

-(CGFloat)getGroupFooterHeight:(NSInteger)section{
    CCTableGroupModel *group = self.tableModel.tableGroupArr[section];
    return group.groupFooterHeight.floatValue;
}

-(CGFloat)getGroupHeaderHeight:(NSInteger)section{
    CCTableGroupModel *group = self.tableModel.tableGroupArr[section];
    return group.groupHeaderHeight.floatValue;
}

-(NSString*)getGroupFooterTitle:(NSInteger)section{
    CCTableGroupModel *group = self.tableModel.tableGroupArr[section];
    return group.groupFooterTitle;
}

-(NSString*)getGroupHeaderTitle:(NSInteger)section{
    CCTableGroupModel *group = self.tableModel.tableGroupArr[section];
    return group.groupHeaderTitle;
}

-(NSDictionary *)getNetParam{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    for (CCTableGroupModel *group in self.tableModel.tableGroupArr) {
        for (CCTableRowModel *row in group.groupRows) {
            NSDictionary *dic = [row getParamArrWith:row];
            for (NSString *key in [dic allKeys]) {
                if ([key isEqualToString:@"content"] ||[key isEqualToString:@"selected"]) {
                    [params setValue:[dic valueForKey:key] forKey:[dic valueForKey:@"ccKey"]];
                }
            }
        }
    }
    
    return params;
}

@end
