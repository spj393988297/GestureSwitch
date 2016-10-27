//
//  PJButton.m
//  
//
//  Created by spj on 15/8/4.
//  Copyright (c) 2015年 spj All rights reserved.
//

#import "PJButton.h"

@interface PJButton ()
// 注意:声明block代码块
@property (nonatomic,copy)buttonBlock tempBlock;
@end

@implementation PJButton
// 普通方法
+(PJButton *)buttonWitnFram:(CGRect)frame title:(NSString *)title textColor:(UIColor *)color andTextFont:(NSInteger)font{
        PJButton *button = [PJButton buttonWithType:UIButtonTypeCustom];
        button.frame = frame;
        [button setTitle:title forState:UIControlStateNormal];
        // 固定写死
        [button setTitleColor:color forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:font];
        
        return button;
}

+(PJButton *)buttonWitnFram:(CGRect)frame title:(NSString *)title selectedTitle:(NSString *)selectedTitle textColor:(UIColor *)color andTextFont:(NSInteger)font{
    PJButton *button = [PJButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:selectedTitle forState:UIControlStateSelected];
    // 固定写死
    [button setTitleColor:color forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    
    return button;
}

// block方法
+(PJButton *)buttonWitnFram:(CGRect)frame title:(NSString *)title image:(NSString *)image andBlock:(buttonBlock)buttonBlock{
    PJButton *button = [PJButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    // 固定写死
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    
    [button addTarget:button action:@selector(buttonBlockClick:) forControlEvents:UIControlEventTouchUpInside];
    button.tempBlock = buttonBlock;
    
    return button;
}
// 实现block的方法
+(PJButton *)buttonWitnFram:(CGRect)frame title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage andBlock:(buttonBlock)buttonBlock{
    PJButton *button = [PJButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    // 固定写死
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:selectImage] forState:UIControlStateSelected];
    button.hidden = YES;
    
    [button addTarget:button action:@selector(buttonBlockClick:) forControlEvents:UIControlEventTouchUpInside];
    button.tempBlock = buttonBlock;
    
    return button;
}

-(void)buttonBlockClick:(UIButton *)button{
    //调用block变量
    if (self.tempBlock) {
        self.tempBlock();
    }
//    _tempBlock();
}
-(void)leftButtonClick:(UIButton *)button{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"leftButtonClick" object:self];
}
-(void)rightButtonClick:(UIButton *)button{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"rightButtonClick" object:self];
}

@end
