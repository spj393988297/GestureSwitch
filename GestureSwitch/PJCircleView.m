//
//  PJCircleView.m
//  cangchudai
//
//  Created by ios05 on 15/10/8.
//  Copyright (c) 2015年 app. All rights reserved.
//

#import "PJCircleView.h"

@implementation PJCircleView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

/**
 初始化
 */
- (void)setup
{
    // 设置按钮不可用
    self.userInteractionEnabled = NO;
    
    // 设置默认的背景图片
    [self setBackgroundImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
    
    // 设置选中的背景图片
    [self setBackgroundImage:[UIImage imageNamed:@"gesture_node_sel"] forState:UIControlStateSelected];
}

@end
