//
//  ViewController.m
//  HcdFormViewDemo
//
//  Created by polesapp-hcd on 2016/12/15.
//  Copyright © 2016年 Jvaeyhcd. All rights reserved.
//

#import "ViewController.h"
#import "HcdFormView.h"

@interface ViewController ()

@property (nonatomic,strong) HcdFormView *formView;
@property (nonatomic,strong) NSMutableArray *columTitles;
@property (nonatomic,strong) NSMutableArray *datas;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initDatas];
    [self setupUI];
    
}

- (void)initDatas {
    _columTitles = [[NSMutableArray alloc]initWithObjects:@"宝马i3 2016新款 基础型", @"宝马i3 2016新款 豪华型", @"宝马i3 2016新款 尊贵型", nil];
    
    NSMutableDictionary *dic1 = [[NSMutableDictionary alloc]init];
    [dic1 setObject:@[@"29.89万", @"39.89万", @"59.89万"] forKey:@"厂家指导价"];
    
    NSMutableDictionary *dic2 = [[NSMutableDictionary alloc]init];
    [dic2 setObject:@[@"29.89万", @"39.89万", @"59.89万"] forKey:@"参考价"];
    
    NSMutableDictionary *dic3 = [[NSMutableDictionary alloc]init];
    [dic3 setObject:@[@"轿车", @"SUV", @"跑车"] forKey:@"级别"];
    
    NSMutableDictionary *dic4 = [[NSMutableDictionary alloc]init];
    [dic4 setObject:@[@"4.89万", @"6.89万", @"7.89万"] forKey:@"政府补贴"];
    
    NSMutableDictionary *dic5 = [[NSMutableDictionary alloc]init];
    [dic5 setObject:@[@"168kw", @"198kw", @"206kw"] forKey:@"功率"];
    
    NSMutableDictionary *dic6 = [[NSMutableDictionary alloc]init];
    [dic6 setObject:@[@"300km/h", @"328km", @"350km"] forKey:@"最高车速"];
    
    NSMutableDictionary *dic7 = [[NSMutableDictionary alloc]init];
    [dic7 setObject:@[@"5.8", @"5.2", @"4.5"] forKey:@"百公里加速"];
    
    NSMutableDictionary *dic8 = [[NSMutableDictionary alloc]init];
    [dic8 setObject:@[@"100", @"115", @"150"] forKey:@"扭距"];
    
    NSMutableDictionary *dic9 = [[NSMutableDictionary alloc]init];
    [dic9 setObject:@[@"200km", @"350km", @"650km"] forKey:@"续航里程"];
    
    NSMutableDictionary *dic10 = [[NSMutableDictionary alloc]init];
    [dic10 setObject:@[@"440", @"560", @"700"] forKey:@"电池容量"];
    
    NSMutableDictionary *sectionDic1 = [[NSMutableDictionary alloc]init];
    [sectionDic1 setObject:@[dic1, dic2, dic3, dic4] forKey:@"基本参数"];
    
    NSMutableDictionary *sectionDic2 = [[NSMutableDictionary alloc]init];
    [sectionDic2 setObject:@[dic5, dic6, dic7, dic8, dic9, dic10] forKey:@"电动机"];
    
    _datas = [[NSMutableArray alloc]initWithObjects:sectionDic1, sectionDic2, nil];
}

- (void)setupUI {
    
    self.title = @"HcdFormView";
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    HcdFormView *hcdFormView = [[HcdFormView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
    hcdFormView.showHeaderView = YES;
    hcdFormView.columTitles = _columTitles;
    hcdFormView.datas = _datas;
    self.formView = hcdFormView;
    
    
    [self.view addSubview:hcdFormView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
