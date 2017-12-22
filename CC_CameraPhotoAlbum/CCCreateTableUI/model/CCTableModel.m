//
//  CCTableModel.m
//  CC_CameraPhotoAlbum
//
//  Created by CC on 2017/12/20.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "CCTableModel.h"

@implementation CCTableModel
+(Class)tableInfor_class{
    return [CCTableInforModel class];
}

+(Class)tableGroupArr_class{
    return [CCTableGroupModel class];
}
@end
