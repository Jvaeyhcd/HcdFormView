//
//  HcdFormView.m
//  HcdFormViewDemo
//
//  Created by polesapp-hcd on 2016/12/15.
//  Copyright © 2016年 Jvaeyhcd. All rights reserved.
//

#import "HcdFormView.h"
#import "FormCellView.h"
#import "FormCell.h"
#import "SingleFormCell.h"
#import "HcdFormViewHeader.h"

@interface HcdFormView()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong) UIView *formHeadView;
@property (nonatomic,strong) UITableView *formTableView;
@property (nonatomic,strong) UITableView *leftTableView;
@property (nonatomic,strong) UIView *horizontalLine, *verticalLine;
@property (nonatomic,strong) UIScrollView *rightScrollView;

@end

@implementation HcdFormView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initDefaultData];
        [self setupUI];
    }
    return self;
}

#pragma mark - Private

- (void)initDefaultData {
    _showHeaderView = NO;
    _columTitles = [[NSMutableArray alloc] init];
    _datas = [[NSMutableArray alloc] init];
}

- (void)setupUI {

    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kColumn * kWidth, kHeight)];
    headView.backgroundColor = kBgColor;
    _formHeadView = headView;
    
    for (int i = 0; i < kColumn; i++) {
        FormCellView *view = [[FormCellView alloc]initWithFrame:CGRectMake(i * kWidth, 0, kWidth - kWidthMargin, kHeight - kHeightMargin)];
        view.detail = [NSString stringWithFormat:@"宝马i %d系列", i + 1];
        view.font = [UIFont systemFontOfSize:12];
        view.textColor = kColor333;
        view.backgroundColor = [UIColor whiteColor];
        [headView addSubview:view];
    }
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kHeight, _formHeadView.frame.size.width, self.frame.size.height - kHeight) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.bounces = NO;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView registerClass:[FormCell class] forCellReuseIdentifier:kCellIdFormCell];
    _formTableView = tableView;
    tableView.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *myScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(kWidth * 0.8, 0, self.frame.size.width - kWidth * 0.8, self.frame.size.height)];
    _rightScrollView = myScrollView;
    [myScrollView addSubview:tableView];
    [myScrollView addSubview:headView];
    myScrollView.bounces = NO;
    myScrollView.contentSize = CGSizeMake(_formHeadView.frame.size.width, 0);
    [self addSubview:myScrollView];
    
    _leftTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kHeight, kWidth * 0.8, self.frame.size.height - kHeight) style:UITableViewStylePlain];
    _leftTableView.delegate = self;
    _leftTableView.dataSource = self;
    _leftTableView.bounces = NO;
    _leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _leftTableView.userInteractionEnabled = NO;
    [_leftTableView registerClass:[SingleFormCell class] forCellReuseIdentifier:kCellIdSingleFormCell];
    [self addSubview:_leftTableView];
    
    _horizontalLine = [[UIView alloc]initWithFrame:CGRectMake(0, kHeight - 1, kWidth * 0.8, 1)];
    _horizontalLine.backgroundColor = kBgColor;
    [self addSubview: _horizontalLine];
    
    _verticalLine = [[UIView alloc]initWithFrame:CGRectMake(kWidth * 0.8 - 1, 0, 1, kHeight)];
    _verticalLine.backgroundColor = kBgColor;
    [self addSubview: _verticalLine];
}

/**
 * 更新UI
 */
- (void)updateUI{
    
    NSInteger column = self.columTitles.count;
    
    _formHeadView.frame = CGRectMake(0, 0, column * kWidth, kHeight);
    _formTableView.frame = CGRectMake(0, kHeight, _formHeadView.frame.size.width, self.frame.size.height - kHeight);
    _rightScrollView.contentSize = CGSizeMake(_formHeadView.frame.size.width, 0);
    _leftTableView.frame = CGRectMake(0, kHeight, kWidth * 0.8, self.frame.size.height - kHeight);
    
    // 移除所有子页面，然后再重新加载
    for(UIView *view in [_formHeadView subviews]) {
        [view removeFromSuperview];
    }
    
    for (int i = 0; i < column; i++) {
        FormCellView *view = [[FormCellView alloc]initWithFrame:CGRectMake(i * kWidth, 0, kWidth - kWidthMargin, kHeight - kHeightMargin)];
        view.detail = [NSString stringWithFormat:@"%@", self.columTitles[i]];
        view.font = [UIFont systemFontOfSize:12];
        view.textColor = kColor333;
        view.backgroundColor = [UIColor whiteColor];
        [_formHeadView addSubview:view];
    }
    
    [_leftTableView reloadData];
    [_formTableView reloadData];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _datas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSMutableDictionary *data = _datas[section];
    
    NSString *key = [data.allKeys objectAtIndex:0];
    NSMutableArray *value = [data objectForKey:key];
    
    return value.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == _formTableView) {
        FormCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdFormCell forIndexPath:indexPath];
        
        NSMutableDictionary *sectionDic = _datas[indexPath.section];
        
        NSString *sectionKey = [sectionDic.allKeys objectAtIndex:0];
        NSMutableArray *sectionDatas = [sectionDic objectForKey:sectionKey];
        
        NSMutableDictionary *rowDic = [sectionDatas objectAtIndex:indexPath.row];
        NSString *rowKey = rowDic.allKeys[0];
        NSMutableArray *rowDatas = [rowDic objectForKey:rowKey];
        cell.values = rowDatas;
        
        return cell;
    } else {
        SingleFormCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdSingleFormCell forIndexPath:indexPath];
        
        NSMutableDictionary *sectionDic = _datas[indexPath.section];
        
        NSString *sectionKey = [sectionDic.allKeys objectAtIndex:0];
        NSMutableArray *sectionDatas = [sectionDic objectForKey:sectionKey];
        
        NSMutableDictionary *rowDic = [sectionDatas objectAtIndex:indexPath.row];
        NSString *rowKey = rowDic.allKeys[0];
        
        cell.title = rowKey;
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (_showHeaderView) {
        return kHeaderHeight;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *view = [[UIView alloc] init];
    
    if (tableView == _leftTableView) {
        view.frame = CGRectMake(0, 0, kWidth * 0.8, kHeaderHeight);
        UILabel *titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, kWidth * 0.8 - 10, kHeaderHeight)];
        titleLbl.font = [UIFont systemFontOfSize:12];
        titleLbl.textColor = kColor333;
        
        NSMutableDictionary *sectionDic = _datas[section];
        
        NSString *sectionKey = [sectionDic.allKeys objectAtIndex:0];
        titleLbl.text = sectionKey;
        
        [view addSubview:titleLbl];
    } else {
        view.frame = CGRectMake(0, 0, kWidth * kColumn, kHeaderHeight);
    }
    
    view.backgroundColor = kBgColor;
    return view;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = _formTableView.contentOffset.y;
    CGPoint leftOffset = _leftTableView.contentOffset;
    leftOffset.y = offsetY;
    
    _leftTableView.contentOffset = leftOffset;
    if(offsetY == 0) {
        _leftTableView.contentOffset = CGPointZero;
    }
}

#pragma mark - Setter

- (void)setShowHeaderView:(BOOL)showHeaderView {
    _showHeaderView = showHeaderView;
    [self updateUI];
}

- (void)setColumTitles:(NSMutableArray *)columTitles {
    _columTitles = columTitles;
    [self updateUI];
}

@end
