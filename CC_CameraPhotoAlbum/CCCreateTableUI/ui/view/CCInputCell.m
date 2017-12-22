//
//  CCInputCell.m
//  CC_CameraPhotoAlbum
//
//  Created by CC on 2017/12/21.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "CCInputCell.h"

@interface CCInputCell()<UITextFieldDelegate>{
    
}
@end
@implementation CCInputCell
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
    [self addSubview:self.input];
}

-(void)layoutSubviews{
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY).with.offset(0);
        make.left.equalTo(self.mas_left).with.offset(10);
        make.height.equalTo(@(20));
        make.width.greaterThanOrEqualTo(@(20)).with.priority(999);
        
    }];
    
    [self.input mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.height.equalTo(@(20));
        make.left.equalTo(self.title.mas_right).with.offset(10);
    }];
}

#pragma mark - set and get
-(UITextField*)input{
    if (_input == nil) {
        _input = [[UITextField alloc] initWithFrame:CGRectZero];
        [_input addTarget:self action:@selector(textFieldTextChange:) forControlEvents:UIControlEventEditingChanged];
        _input.delegate = self;
        _input.textAlignment = NSTextAlignmentRight;
    }
    return _input;
}

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

#pragma mark - method
-(void)textFieldTextChange:(UITextField*)sender{
    NSLog(@"input=%@",sender.text);
    if (self.inputBlock) {
        self.inputBlock(sender.text,self.currentIndex);
    }
}


@end
