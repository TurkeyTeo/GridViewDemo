//
//  ViewController.m
//  GridViewDemo
//
//  Created by Thinkive on 16/6/22.
//  Copyright © 2016年 Thinkive. All rights reserved.
//

#import "ViewController.h"
#import "TKIMTeoDisModel.h"
#import "TKIMTeoDisScroll.h"

@interface ViewController ()<DisItemClickDelegate>

@property (nonatomic, strong) TKIMTeoDisScroll *disScroll;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"发现";
    //    [self.view addCssClass:@".IMBground"];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self _initDiscoryScrollV];
    [self _loadData];
    
}

- (void)_initDiscoryScrollV{
    self.disScroll = [[TKIMTeoDisScroll alloc] initWithFrame:self.view.bounds];
    self.disScroll.disDelegate = self;
    [self.view addSubview:self.disScroll];
}

- (void)_loadData{
    TKIMTeoDisModel *model1 = [[TKIMTeoDisModel alloc] init];
    model1.title = @"邮箱";
    model1.imageString = @"menu_item_mailD";
    
    TKIMTeoDisModel *model2 = [[TKIMTeoDisModel alloc] init];
    model2.title = @"OA";
    model2.imageString = @"menu_item_oaD";
    
    TKIMTeoDisModel *model3 = [[TKIMTeoDisModel alloc] init];
    model3.title = @"更多";
    model3.imageString = @"menu_item_add";
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:model1,model2,model3, nil];
    self.disScroll.dataArray = array;
}

#pragma mark -- DisDelegate
- (void)discovryItemClick:(TKIMTeoDisModel *)model;{
    NSLog(@"Do someThing you want");
}
@end
