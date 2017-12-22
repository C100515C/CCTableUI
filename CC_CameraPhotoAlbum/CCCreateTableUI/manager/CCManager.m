//
//  CCManager.m
//  CC_CameraPhotoAlbum
//
//  Created by CC on 2017/12/22.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "CCManager.h"

@implementation CCManager
#pragma mark - set ui model
-(void)setCellWith:(NSIndexPath*)index andCell:(CCBaseTableCell*)cell{
    CCTableRowModel *row = [self.modelManager getRowModelWith:index];
    cell.currentIndex = index;
    
    if ([cell isKindOfClass:[CCInputCell class]]) {
        CCInputCell *input = (CCInputCell*)cell;
        [self setInputCell:input andModel:row];
    }else if ([cell isKindOfClass:[CCSelectCell class]]){
        CCSelectCell *select = (CCSelectCell*)cell;
        [self setSelectCell:select andModel:row];
    }else if ([cell isKindOfClass:[CCArrowCell class]]){
        CCArrowCell *arrow = (CCArrowCell*)cell;
        [self setArrowCell:arrow andModel:row];
    }
    
}

-(void)setInputCell:(CCInputCell*)cell andModel:(CCTableRowModel*)model{
    cell.title.text = model.title;
    cell.input.placeholder = model.placeholder;
    cell.input.keyboardType = model.keboardType.integerValue;
    
    __weak typeof(self) weakself = self;
    cell.inputBlock = ^(NSString *text,NSIndexPath *index) {
        CCTableRowModel *row = [weakself.modelManager getRowModelWith:index];
        row.content = text;
    };
}

-(void)setSelectCell:(CCSelectCell*)cell andModel:(CCTableRowModel*)model{
    cell.title.text = model.title;
    cell.btnTitles = model.selectTitles;
    
    __weak typeof(self) weakself = self;
    cell.selectedAction = ^(NSInteger value,NSIndexPath *index) {
        CCTableRowModel *row = [weakself.modelManager getRowModelWith:index];
        row.selected = [NSString stringWithFormat:@"%ld",value];
    };
}

-(void)setArrowCell:(CCArrowCell*)cell andModel:(CCTableRowModel*)model{
    cell.title.text = model.title;
    
    __weak typeof(self) weakself = self;
    cell.selectedAction = ^(NSInteger value,NSIndexPath *index) {
        CCTableRowModel *row = [weakself.modelManager getRowModelWith:index];
        NSLog(@"选中 arrow");
    };
}

-(UIView*)setHeaderWith:(NSInteger)section andTable:(UITableView*)table{
    CGFloat height = [self.modelManager getGroupHeaderHeight:section];
    if (height==0) {
        return nil;
    }
    CCGroupHeader *header = [self.viewManager createHeaderWith:@"header" andTable:table];
    CCTableGroupModel *group = self.modelManager.tableModel.tableGroupArr[section];
    header.title.text = group.groupHeaderTitle;

    return header;
}

-(UIView *)setFooterWith:(NSInteger)section andTable:(UITableView*)table{
    CGFloat height = [self.modelManager getGroupHeaderHeight:section];
    if (height==0) {
        return nil;
    }
    
    CCGroupFooter *footer = [self.viewManager createFooterWith:@"footer" andTable:table];
    CCTableGroupModel *group = self.modelManager.tableModel.tableGroupArr[section];
    footer.title.text = group.groupFooterTitle;
    
    return footer;
}

#pragma mark - get
-(CCModelManager*)modelManager{
    if (_modelManager==nil) {
        _modelManager = [[CCModelManager alloc] init];
    }
    return _modelManager;
}

-(CCViewManager*)viewManager{
    if (_viewManager==nil) {
        _viewManager = [[CCViewManager alloc] init];
    }
    return _viewManager;
}

-(NSDictionary*)getParamDic{
    return [self.modelManager getNetParam];
}

@end
