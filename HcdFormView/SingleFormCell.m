//
//  SingleFormCell.m
//  HcdFormViewDemo
//
//  Created by polesapp-hcd on 2016/12/15.
//  Copyright © 2016年 Jvaeyhcd. All rights reserved.
//

#import "SingleFormCell.h"
#import "HcdFormViewHeader.h"

@interface SingleFormCell()

@property (nonatomic, strong) FormCellView *formCellView;

@end

@implementation SingleFormCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = kBgColor;
        _formCellView = [[FormCellView alloc]initWithFrame:CGRectMake(0, 0, kWidth * 0.8 - kWidthMargin, kHeight - kHeightMargin)];
        _formCellView.font = [UIFont systemFontOfSize:14];
        _formCellView.textColor = kColor333;
        [self.contentView addSubview:_formCellView];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTitle:(NSString *)title {
    _title = title;
    _formCellView.detail = title;
}

@end
