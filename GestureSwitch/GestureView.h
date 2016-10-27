//
//  GestureView.h
//  GestureSwitch
//
//  Created by spj on 16/10/25.
//  Copyright © 2016年 spj All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+method.h"
#import "PJButton.h"
#import "PJLockView.h"

@interface GestureView : UIView

- (void)loadUI;

@property (nonatomic, strong) UILabel *titleLable;//标题
@property (nonatomic, strong) PJButton *cancleButton;//按钮
@property (nonatomic, strong) PJLockView *lockView;//手势试图

@property (nonatomic, strong) NSString* indexStr;//0表示修改,1表示启动进入

@end

