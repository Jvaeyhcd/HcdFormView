//
//  FormCellView.h
//  HcdFormViewDemo
//
//  Created by polesapp-hcd on 2016/12/15.
//  Copyright © 2016年 Jvaeyhcd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FormCellView;

@protocol FormCellViewDelegate <NSObject>

- (void)formCellView:(FormCellView *)formCellView point:(CGPoint)point;

@end

@interface FormCellView : UIView

@property (nonatomic, weak) NSString *detail;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, weak) id<FormCellViewDelegate> delegate;

@end
