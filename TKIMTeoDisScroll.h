//
//  TKIMTeoDisScroll.h
//  TKIM_标准版
//
//  Created by Thinkive on 16/6/21.
//  Copyright © 2016年 liupm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TKIMTeoDisItemView.h"

@protocol DisItemClickDelegate <NSObject>

- (void)discovryItemClick:(TKIMTeoDisModel *)model;

@end

@interface TKIMTeoDisScroll : UIScrollView<UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, weak) id<DisItemClickDelegate> disDelegate;

@end
