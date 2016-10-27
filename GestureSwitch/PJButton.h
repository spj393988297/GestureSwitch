//
//  PJButton.h
//  
//
//  Created by spj on 15/8/4.
//  Copyright (c) 2015年 spj. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^buttonBlock)();

@interface PJButton : UIButton
// 通过类方法得到一个按钮
// 1.驼峰 2.做到见名知意
//无绑定事件
+(PJButton *)buttonWitnFram:(CGRect)frame title:(NSString *)title textColor:(UIColor *)color andTextFont:(NSInteger)font;

+(PJButton *)buttonWitnFram:(CGRect)frame title:(NSString *)title selectedTitle:(NSString *)selectedTitle textColor:(UIColor *)color andTextFont:(NSInteger)font;

// 实现block的方法
+(PJButton *)buttonWitnFram:(CGRect)frame title:(NSString *)title image:(NSString *)image andBlock:(buttonBlock)buttonBlock;
+(PJButton *)buttonWitnFram:(CGRect)frame title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage andBlock:(buttonBlock)buttonBlock;
@end
