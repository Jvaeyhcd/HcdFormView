//
//  FormCell.m
//  HcdFormViewDemo
//
//  Created by polesapp-hcd on 2016/12/15.
//  Copyright © 2016年 Jvaeyhcd. All rights reserved.
//

#import "FormCell.h"
#import "HcdFormViewHeader.h"

@implementation FormCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.backgroundColor = kBgColor;
        for(int i = 0; i < 20; i++){
            FormCellView *formCellView = [[FormCellView alloc]initWithFrame:CGRectMake(i * kWidth, 0, kWidth - kWidthMargin, kHeight - kHeightMargin)];
            formCellView.delegate = self;
            formCellView.backgroundColor = [UIColor whiteColor];//[UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
            [self.contentView addSubview:formCellView];
        }
        
    }
    
    return self;
}

- (void)formCellView:(FormCellView *)formCellView point:(CGPoint)point {
    if ([self.delegate respondsToSelector:@selector(formCellView:point:)]) {
        [self.delegate formCellView:formCellView point:point];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setValues:(NSMutableArray *)values {
    
    _values = [values copy];
    
    for (UIView *view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    for(int i = 0; i < values.count; i++){
        
        NSString *value = [values objectAtIndex:i];
        
        FormCellView *formCellView = [[FormCellView alloc]initWithFrame:CGRectMake(i * kWidth, 0, kWidth - kWidthMargin, kHeight - kHeightMargin)];
        formCellView.delegate = self;
        formCellView.backgroundColor = [UIColor whiteColor];//[UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
        formCellView.detail = value;
        formCellView.font = [UIFont systemFontOfSize:12];
        formCellView.textColor = kColor999;
        [self.contentView addSubview:formCellView];
    }
}

@end
