//
//  CCBaseTableCell.m
//  CC_CameraPhotoAlbum
//
//  Created by CC on 2017/12/21.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "CCBaseTableCell.h"

@implementation CCBaseTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(CCBaseTableCell*)initWith:(NSString *)identifier{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setSepectorLine];
        [self setUI];
    }
    return self;
}
#pragma mark - 子类重写
//子类重写
-(void)setUI{
    
}
-(void)setCellWith:(id)model{
    
}

-(void)setSepectorLine{
    UIView *line = [[UIView alloc] initWithFrame:CGRectZero];
    [self addSubview:line];
    line.backgroundColor = [UIColor darkTextColor];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(10);
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.height.equalTo(@(0.5));
        make.bottom.equalTo(self.mas_bottom).with.offset(-0.5);
    }];
}
@end
