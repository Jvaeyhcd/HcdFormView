//
//  FormCellView.m
//  HcdFormViewDemo
//
//  Created by polesapp-hcd on 2016/12/15.
//  Copyright © 2016年 Jvaeyhcd. All rights reserved.
//

#import "FormCellView.h"

@interface FormCellView()

@property (nonatomic,strong) UILabel *detailLbl;

@end

@implementation FormCellView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.detailLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        self.detailLbl.textAlignment = NSTextAlignmentCenter;
        self.detailLbl.font = [UIFont systemFontOfSize:12];
        self.detailLbl.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height - self.frame.size.height * 0.5);
        self.detailLbl.numberOfLines = 0;
        [self addSubview:self.detailLbl];
        
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapView:)]];
    }
    
    return self;
}

- (void)tapView:(UITapGestureRecognizer *)tap
{
    CGPoint point=[tap locationInView:self];
    if ([self.delegate respondsToSelector:@selector(formCellView:point:)]) {
        [self.delegate formCellView:self point:point];
    }
}

- (void)setDetail:(NSString *)detail {
    _detail = detail;
    self.detailLbl.text = detail;
}

- (void)setFont:(UIFont *)font {
    _font = font;
    self.detailLbl.font = _font;
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    self.detailLbl.textColor = _textColor;
}

@end
