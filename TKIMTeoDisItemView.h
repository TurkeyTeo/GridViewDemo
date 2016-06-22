//
//  TKIMTeoDisItemView.h
//  TKIM_标准版
//
//  Created by Thinkive on 16/6/21.
//  Copyright © 2016年 liupm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TKIMTeoDisModel.h"
#import "TKIMTeoDisModel.h"

typedef void(^BtnClickBlock)(TKIMTeoDisModel *disModel);

@interface TKIMTeoDisItemView : UIView

@property (nonatomic, strong) TKIMTeoDisModel *itemModel;
@property (nonatomic, assign) BOOL hidenIcon;

@property (nonatomic, copy) BtnClickBlock clickBlock;


@end
