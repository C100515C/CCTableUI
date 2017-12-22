//
//  CCSelectCell.m
//  CC_CameraPhotoAlbum
//
//  Created by CC on 2017/12/21.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "CCSelectCell.h"

@interface CCSelectCell(){
    UIButton *_firstBtn;
    UIButton *_secondBtn;
    UIButton *_tmpSelectBtn;
}

@end
@implementation CCSelectCell
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
    [self addSubview: self.title];
    [self createBtns];
}

-(void)layoutSubviews{
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY).with.offset(0);
        make.left.equalTo(self.mas_left).with.offset(10);
        make.height.equalTo(@(20));
        make.width.greaterThanOrEqualTo(@(20)).with.priority(999);
        
    }];
    
    [_secondBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.height.equalTo(@(20));
        make.width.equalTo(@(40));
        
    }];
    
    [_firstBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY).with.offset(0);
        make.right.equalTo(_secondBtn.mas_left).with.offset(-10);
        make.height.equalTo(@(20));
        make.width.equalTo(@(40));

    }];

}
#pragma  mark -set sub views
-(void)createBtns{
    _firstBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_firstBtn setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateNormal];
    [_firstBtn setTitle:@"是" forState:UIControlStateNormal];
    _firstBtn.titleLabel.font = FONT(15);
    [_firstBtn setTitleColor:RGB(51,51,51) forState:UIControlStateNormal];
    [self addSubview:_firstBtn];
    [_firstBtn addTarget:self action:@selector(btnSelelcted:) forControlEvents:UIControlEventTouchUpInside];
    _firstBtn.tag = 1;
    _tmpSelectBtn = _firstBtn;
    
    _secondBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_secondBtn setImage:[UIImage imageNamed:@"unSelected"] forState:UIControlStateNormal];
    [_secondBtn setTitle:@"否" forState:UIControlStateNormal];
    _secondBtn.titleLabel.font = FONT(15);
    [_secondBtn setTitleColor:RGB(51,51,51) forState:UIControlStateNormal];
    [self addSubview:_secondBtn];
    [_secondBtn addTarget:self action:@selector(btnSelelcted:) forControlEvents:UIControlEventTouchUpInside];
    _secondBtn.tag = 0;
}

#pragma mark - method
-(void)btnSelelcted:(UIButton *)sender{
    [_tmpSelectBtn setImage:[UIImage imageNamed:@"unSelected"] forState:UIControlStateNormal];
    [sender setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateNormal];
    _tmpSelectBtn = sender;
    
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

-(void)setBtnTitles:(NSArray *)btnTitles{
    NSArray *btns = @[_firstBtn,_secondBtn];
    for (int i=0; i<btns.count; i++) {
        UIButton *btn = btns[i];
        [btn setTitle:btnTitles[i] forState:UIControlStateNormal];
    }
}

@end
