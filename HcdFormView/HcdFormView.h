//
//  HcdFormView.h
//  HcdFormViewDemo
//
//  Created by polesapp-hcd on 2016/12/15.
//  Copyright © 2016年 Jvaeyhcd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HcdFormView : UIView

// 是否显示headerView默认NO
@property (nonatomic, assign) BOOL showHeaderView;

// 每一列的标题
@property (nonatomic, strong) NSMutableArray *columTitles;
// 每一行的数据，数组里面是一个字典，字典里面又是一个存了字典的数组
@property (nonatomic, strong) NSMutableArray *datas;

@end
