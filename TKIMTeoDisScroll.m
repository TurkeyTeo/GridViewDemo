//
//  TKIMTeoDisScroll.m
//  TKIM_标准版
//
//  Created by Thinkive on 16/6/21.
//  Copyright © 2016年 liupm. All rights reserved.
//

#import "TKIMTeoDisScroll.h"
#import "TKIMTeoDisItemView.h"

#define kHomeGridViewPerRowItemCount 4

@implementation TKIMTeoDisScroll
{
    NSMutableArray *_itemsArray;
    NSMutableArray *_rowSeparatorsArray;
    NSMutableArray *_columnSeparatorsArray;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.delegate = self;
        _itemsArray = [NSMutableArray array];
        _rowSeparatorsArray = [NSMutableArray array];
        _columnSeparatorsArray = [NSMutableArray array];
    }
    return self;
}


#pragma mark - properties

- (void)setDataArray:(NSMutableArray *)dataArray{
    _dataArray = dataArray;
    
    [dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        TKIMTeoDisItemView *item = [[TKIMTeoDisItemView alloc] init];
        item.itemModel = obj;

//        ************************************************
        
        __weak typeof(self) weakSelf = self;
        item.clickBlock = ^(TKIMTeoDisModel *model){
            if ([weakSelf.disDelegate respondsToSelector:@selector(discovryItemClick:)]) {
                [weakSelf.disDelegate discovryItemClick:model];
            }
        };
        
        [self addSubview:item];
        [_itemsArray addObject:item];
    }];
    
    long rowCount = [self rowCountWithItemsCount:dataArray.count];
    
    for (int i = 0; i < (rowCount + 1); i++) {
        UIView *rowSeparator = [[UIView alloc] init];
        rowSeparator.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:rowSeparator];
        [_rowSeparatorsArray addObject:rowSeparator];
    }
    
    for (int i = 0; i < (kHomeGridViewPerRowItemCount + 1); i++) {
        UIView *columnSeparator = [[UIView alloc] init];
        columnSeparator.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:columnSeparator];
        [_columnSeparatorsArray addObject:columnSeparator];
    }
}

- (NSInteger)rowCountWithItemsCount:(NSInteger)count
{
    long rowCount = (count + kHomeGridViewPerRowItemCount - 1) / kHomeGridViewPerRowItemCount;
    return rowCount;
}


- (void)layoutSubviews{
    [super layoutSubviews];

    CGFloat itemW = self.frame.size.width / kHomeGridViewPerRowItemCount;
    CGFloat itemH = itemW * 1.1;

    [self setupSubViewsFrame];
    [_rowSeparatorsArray enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
        CGFloat w = self.frame.size.width;
        CGFloat h = 0.4;
        CGFloat x = 0;
        CGFloat y = idx * itemH;
        view.frame = CGRectMake(x, y, w, h);
        [self bringSubviewToFront:view];
    }];
    
    [_columnSeparatorsArray enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
        CGFloat w = 0.4;
        CGFloat h = self.contentSize.height;
        CGFloat x = idx * itemW;
        CGFloat y = 0;
        view.frame = CGRectMake(x, y, w, h);
        [self bringSubviewToFront:view];
    }];
}


- (void)setupSubViewsFrame
{
    CGFloat itemW = self.frame.size.width / kHomeGridViewPerRowItemCount;
    CGFloat itemH = itemW * 1.1;
    [_itemsArray enumerateObjectsUsingBlock:^(UIView *item, NSUInteger idx, BOOL *stop) {
        long rowIndex = idx / kHomeGridViewPerRowItemCount;
        long columnIndex = idx % kHomeGridViewPerRowItemCount;
        
        CGFloat x = itemW * columnIndex;
        CGFloat y = itemH * rowIndex;
        item.frame = CGRectMake(x, y, itemW, itemH);
        if (idx == (_itemsArray.count - 1)) {
            self.contentSize = CGSizeMake(0, item.frame.size.height + item.frame.origin.y);
        }
    }];
}



@end
