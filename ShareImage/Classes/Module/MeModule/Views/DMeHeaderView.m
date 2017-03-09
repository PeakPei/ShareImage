//
//  DMeHeaderView.m
//  ShareImage
//
//  Created by DaiSuke on 2017/3/7.
//  Copyright © 2017年 DaiSuke. All rights reserved.
//

#import "DMeHeaderView.h"
#import "DHomeCellTipLabel.h"
#import "DMeHeaderFunctionView.h"
#import <SDWebImage/UIImageView+WebCache.h>

#import "DPhotosModel.h"

@interface DMeHeaderView ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) DHomeCellTipLabel *addressLabel;
@property (nonatomic, strong) DHomeCellTipLabel *emailLabel;
@property (nonatomic, strong) UILabel *bioLabel;
@property (nonatomic, strong) DMeHeaderFunctionView *functionView;

@end

@implementation DMeHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.bgImbageView];
        [self addSubview:self.nameLabel];
        [self addSubview:self.addressLabel];
        [self addSubview:self.bioLabel];
        [self addSubview:self.emailLabel];
        [self addSubview:self.functionView];
    }
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.bgImbageView.sd_layout
    .topEqualToView(self)
    .leftEqualToView(self)
    .rightEqualToView(self)
    .heightIs(250);
    
    self.nameLabel.sd_layout
    .topSpaceToView(self, 160)
    .leftSpaceToView(self , 15)
    .rightSpaceToView(self , 15)
    .heightIs(25);
    
    if (KGLOBALINFOMANAGER.accountInfo.location.length > 0) {
        self.addressLabel.sd_layout
        .topSpaceToView(self.nameLabel, 10)
        .leftSpaceToView(self , 15)
        .rightSpaceToView(self , 15)
        .heightIs(25);
        
        self.emailLabel.sd_layout
        .topSpaceToView(self.addressLabel, 10)
        .leftSpaceToView(self , 15)
        .rightSpaceToView(self , 15)
        .heightIs(25);
    } else {
        self.emailLabel.sd_layout
        .topSpaceToView(self.nameLabel, 10)
        .leftSpaceToView(self , 15)
        .rightSpaceToView(self , 15)
        .heightIs(25);
    }
    
    
    
    
//    self.bioLabel.sd_layout
//    .topSpaceToView(self.emailLabel, 10)
//    .leftSpaceToView(self , 15)
//    .rightSpaceToView(self , 15)
//    .autoHeightRatio(0);
    
    self.functionView.sd_layout
    .topSpaceToView(self, 250)
    .leftEqualToView(self)
    .rightEqualToView(self)
    .heightIs(70);
    
}

- (void)reloadData{
    DPhotosModel *photo = [KGLOBALINFOMANAGER.accountInfo.u_photos firstObject];
    [self.bgImbageView sd_setImageWithURL:[NSURL URLWithString:photo.urls.regular]];
    self.nameLabel.text = KGLOBALINFOMANAGER.accountInfo.name;
    self.addressLabel.describe = KGLOBALINFOMANAGER.accountInfo.location;
    if (KGLOBALINFOMANAGER.accountInfo.email.length > 0) {
        self.emailLabel.hidden = NO;
        self.emailLabel.describe = KGLOBALINFOMANAGER.accountInfo.email;
    }
//    self.bioLabel.text = KGLOBALINFOMANAGER.accountInfo.bio;
    
    [self.functionView reloadData];
    [self setNeedsLayout];
}

#pragma mark - setter & getter
- (UIImageView *)bgImbageView{
    if (!_bgImbageView) {
        _bgImbageView = [[UIImageView alloc] init];
        
        _bgImbageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _bgImbageView;
}

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:22.0];
    }
    return _nameLabel;
}

- (DHomeCellTipLabel *)addressLabel{
    if (!_addressLabel) {
        _addressLabel = [[DHomeCellTipLabel alloc] init];
        _addressLabel.iconName = @"common_btn_address_hight";
        _addressLabel.describeLabel.textColor = [UIColor whiteColor];
        _addressLabel.describeLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:14.0];
        _addressLabel.mode = HomeCellTipLabelCenter;
    }
    return _addressLabel;
}


- (DHomeCellTipLabel *)emailLabel{
    if (!_emailLabel) {
        _emailLabel = [[DHomeCellTipLabel alloc] init];
        _emailLabel.iconName = @"common_btn_address_hight";
        _emailLabel.describeLabel.textColor = [UIColor whiteColor];
        _emailLabel.describeLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:14.0];
        _emailLabel.mode = HomeCellTipLabelCenter;
        _emailLabel.hidden = YES;
    }
    return _emailLabel;
}

- (UILabel *)bioLabel{
    if (!_bioLabel) {
        _bioLabel = [[UILabel alloc] init];
        _bioLabel.numberOfLines = 0;
        _bioLabel.textColor = [UIColor whiteColor];
        _bioLabel.textAlignment = NSTextAlignmentCenter;
        _bioLabel.font = DSystemFontText;
    }
    return _bioLabel;
}


- (DMeHeaderFunctionView *)functionView{
    if (!_functionView) {
        _functionView = [[DMeHeaderFunctionView alloc] init];
        _functionView.backgroundColor = [UIColor whiteColor];
    }
    return _functionView;
}




@end