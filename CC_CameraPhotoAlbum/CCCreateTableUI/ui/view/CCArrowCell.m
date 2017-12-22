//
//  CCArrowCell.m
//  CC_CameraPhotoAlbum
//
//  Created by CC on 2017/12/21.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "CCArrowCell.h"

@interface CCArrowCell(){
    UILabel *_arrowTitle;
    UIImageView *_arrow;
    UIButton *_arrowBtn;
}
@end

@implementation CCArrowCell
@synthesize title = _title;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setUI{
    [self addSubview:self.title];
    [self createViews];
}

-(void)layoutSubviews{
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY).with.offset(0);
        make.left.equalTo(self.mas_left).with.offset(10);
        make.height.equalTo(@(20));
        make.width.greaterThanOrEqualTo(@(20)).with.priority(999);
        
    }];
    
    [_arrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.height.equalTo(@(12));
        make.width.equalTo(@(7));
        
    }];
    
    [_arrowTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY).with.offset(0);
        make.right.equalTo(_arrow.mas_left).with.offset(-5);
        make.height.equalTo(@(20));
        make.width.greaterThanOrEqualTo(@(20));
        
    }];
    
    [_arrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(0);
        make.height.equalTo(self.mas_height);
        make.width.equalTo(@(80));
        
    }];
    
}
#pragma  mark -set sub views
-(void)createViews{
    _arrow = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self addSubview:_arrow];
    _arrow.image = [UIImage imageNamed:@"箭头"];
    
    _arrowTitle = [[UILabel alloc] initWithFrame:CGRectZero];
    _arrowTitle.textColor = RGB(187,187,187);
    _arrowTitle.font = FONT(15);
    _arrowTitle.textAlignment = NSTextAlignmentRight;
    _arrowTitle.backgroundColor = [UIColor whiteColor];
    [self addSubview:_arrowTitle];
    _arrowTitle.hidden = YES;
    
    _arrowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_arrowBtn];
    [_arrowBtn addTarget:self action:@selector(arrowClicked:) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark - method
-(void)arrowClicked:(UIButton *)sender{
    if (self.selectedAction) {
        self.selectedAction(sender.tag,self.currentIndex);
    }
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

-(void)setHideArrowTitle:(BOOL)hideArrowTitle{
    _hideArrowTitle = hideArrowTitle;
    _arrowTitle.hidden = hideArrowTitle;
}


@end
