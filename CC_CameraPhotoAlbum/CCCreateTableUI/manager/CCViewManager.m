//
//  CCViewManager.m
//  CC_CameraPhotoAlbum
//
//  Created by CC on 2017/12/21.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "CCViewManager.h"


@implementation CCViewManager

-(CCBaseTableCell*)createCellWith:(CC_cell_type)type andIdentifier:(NSString *)identifier andTable:(UITableView*)table{
    
    CCBaseTableCell *cell =nil;
    
    switch (type) {
        case CC_cell_input:
            {
                NSString *ident = identifier.length==0?CCInputCellID:identifier;
                cell = [table dequeueReusableCellWithIdentifier:ident];
                if (cell==nil) {
                    cell = [[CCInputCell alloc] initWith:ident];
                }
                
            }
            break;
        case CC_cell_select:
        {
            NSString *ident = identifier.length==0?CCSelectCellID:identifier;
            cell = [table dequeueReusableCellWithIdentifier:ident];
            if (cell==nil) {
                 cell = [[CCSelectCell alloc] initWith:ident];
            }
           

        }
            break;
        case CC_cell_arrow:
        {
            NSString *ident = identifier.length==0?CCArrowCellID:identifier;
            cell = [table dequeueReusableCellWithIdentifier:ident];
            if (cell==nil) {
                cell = [[CCArrowCell alloc] initWith:ident];
            }
            

        }
            break;
        default:
            break;
    }
    
    return cell;
}


-(CCGroupFooter*)createFooterWith:(NSString *)identifier andTable:(UITableView*)table{
    CCGroupFooter *footer = [table dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (footer==nil) {
        footer = [[CCGroupFooter alloc] initWithReuseIdentifier:identifier];
    }
    return footer;
}

-(CCGroupHeader*)createHeaderWith:(NSString *)identifier andTable:(UITableView *)table{
    CCGroupHeader *header = [table dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (header==nil) {
        header = [[CCGroupHeader alloc] initWithReuseIdentifier:identifier];
    }
    return header;
}

@end
