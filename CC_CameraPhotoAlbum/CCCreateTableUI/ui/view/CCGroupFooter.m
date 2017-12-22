//
//  CCGroupFooter.m
//  CC_CameraPhotoAlbum
//
//  Created by CC on 2017/12/22.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "CCGroupFooter.h"
#import "CCTable.h"

@implementation CCGroupFooter
- (instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUI];
    }
    return self;
}

-(void)setUI{
    [self addSubview:self.title];
}

-(void)layoutSubviews{
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.left.equalTo(self.mas_left).with.offset(10);
        make.top.equalTo(self.mas_top).with.offset(0);
        make.bottom.equalTo(self.mas_bottom).with.offset(0);

    }];
}

#pragma mark - set and get
-(UILabel *)title{
    if (_title==nil) {
        _title = [[UILabel alloc] initWithFrame:CGRectZero];
        _title.textColor = RGB(51,51,51);
        _title.font = FONT(15);
        _title.textAlignment = NSTextAlignmentLeft;
        _title.backgroundColor = [UIColor whiteColor];
    }
    return _title;
}

@end
