//
//  FormCell.h
//  HcdFormViewDemo
//
//  Created by polesapp-hcd on 2016/12/15.
//  Copyright © 2016年 Jvaeyhcd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FormCellView.h"

#define kCellIdFormCell @"FormCell"

@protocol FormCellDelegate <NSObject>

- (void)formCellView:(FormCellView *)formCellView point:(CGPoint)point;

@end

@interface FormCell : UITableViewCell <FormCellViewDelegate>

@property (nonatomic, weak) id<FormCellDelegate> delegate;
@property (nonatomic, strong) NSMutableArray *values;

@end
