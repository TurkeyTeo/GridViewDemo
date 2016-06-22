//
//  TKIMTeoDisItemButton.m
//  TKIM_标准版
//
//  Created by Thinkive on 16/6/21.
//  Copyright © 2016年 liupm. All rights reserved.
//

#import "TKIMTeoDisItemButton.h"

@implementation TKIMTeoDisItemButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat h = self.frame.size.height * 0.3;
    CGFloat w = h;
    CGFloat x = (self.frame.size.width - w) * 0.5;
    CGFloat y = self.frame.size.height * 0.3;
    return CGRectMake(x, y, w, h);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, self.frame.size.height * 0.6, self.frame.size.width, self.frame.size.height * 0.3);
}

@end
