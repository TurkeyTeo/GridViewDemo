//
//  TKIMTeoDisItemView.m
//  TKIM_标准版
//
//  Created by Thinkive on 16/6/21.
//  Copyright © 2016年 liupm. All rights reserved.
//

#import "TKIMTeoDisItemView.h"
#import "TKIMTeoDisItemButton.h"

@implementation TKIMTeoDisItemView
{
    TKIMTeoDisItemButton *_button;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initialization];
    }
    return self;
}

- (void)initialization{
    self.backgroundColor = [UIColor whiteColor];

    TKIMTeoDisItemButton *btn = [[TKIMTeoDisItemButton alloc] init];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    
    _button = btn;
    
}

- (void)btnClick:(UIButton *)btn{
    if (self.clickBlock) {
        self.clickBlock(self.itemModel);
    }
}

- (void)setItemModel:(TKIMTeoDisModel *)itemModel{
    _itemModel = itemModel;
    
    if (itemModel.title) {
        [_button setTitle:itemModel.title forState:UIControlStateNormal];
    }
    
    if (itemModel.imageString) {
        [_button setImage:[UIImage imageNamed:itemModel.imageString] forState:UIControlStateNormal];
    }
}

#pragma mark - life circles

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _button.frame = self.bounds;
}

@end
