//
//  NSObject+method.m
//  
//
//  Created by yyd on 15/8/6.
//  Copyright (c) 2015年 YangAnDong. All rights reserved.
//

#import "NSObject+method.h"

@implementation UILabel (newLabel)


+(UILabel *)labelWithFram:(CGRect)frame font:(NSInteger)font tintColor:(UIColor *)color andTitle:(NSString *)title{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    
    label.text = title;
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:font];
    
    return label;
}
@end

@implementation UITextField (newTextField)
//borderStyle如果是0没有边框否则有边框
+(UITextField *)textFiledWithFrame:(CGRect)frame font:(NSInteger)font borderStyle:(NSInteger)borderStyle andPlaceholder:(NSString *)placeholder{
    UITextField *textField = [[UITextField alloc]initWithFrame:frame];
    textField.placeholder = placeholder;
    textField.clearButtonMode = UITextFieldViewModeNever;
//    textField.clearsOnBeginEditing = YES;
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    if (borderStyle == 0) {
        textField.borderStyle = UITextBorderStyleNone;
    }else{
        textField.borderStyle = UITextBorderStyleRoundedRect;
    }
    
    textField.font = [UIFont systemFontOfSize:font];
    
    return textField;
}
@end

@implementation UIImageView (newUIImageView)

+(UIImageView *)imageViewWithFrame:(CGRect)frame addImage:(NSString *)image{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    imageView.image = [UIImage imageNamed:image];
    
    return imageView;
}
@end

@implementation UIResponder(newUIResponder)

//frame适配
//宽高相同
-(CGRect)getRectWithX:(CGFloat)x RectWithY:(CGFloat)y RectWithWidth:(CGFloat)width andRectWithWidth:(CGFloat)height{
    CGRect rect = CGRectZero;
//    CGFloat sub = 64.0+49.0;
//    if (kIPHONE4 || kIPHONE5) {
//        rect = CGRectMake(x, y, width, height);
//    }else if (kIPHONE6){//6
//        rect = CGRectMake(x, y, width*(375/320.0), height*(375/320.0));
//    }else{//6P
//        rect = CGRectMake(x, y, width*((414-sub)/(320.0-sub)), height*((414-sub)/(320.0-sub)));
//    }
    
    return rect;
}
//宽高不同
-(CGRect)getRectWithX:(CGFloat)x RectWithY:(CGFloat)y RectWithWidth:(CGFloat)width andRectWithHeight:(CGFloat)height{
    CGRect rect = CGRectZero;
//    CGFloat sub = 64.0+49.0;
//    if (kIPHONE4 || kIPHONE5) {
//        rect = CGRectMake(x, y, width, height);
//    }else if (kIPHONE6){//6
//        rect = CGRectMake(x, y, width*(375/320.0), height*(667/480.0));
//    }else{//6P
//        rect = CGRectMake(x, y, width*((414-sub)/(320.0-sub)), height*((736-sub)/(480.0-sub)));
//    }
    
    return rect;
}
//宽度适配
-(CGFloat)width:(CGFloat)oldWidth{
    CGFloat newWidth;
//    if (kIPHONE4 || kIPHONE5){
//        newWidth = oldWidth;
//    }else if (kIPHONE6){
//        newWidth = oldWidth*375/320;
//    }else{
//        newWidth = oldWidth*414/320;
//    }
    return newWidth;
}
//高度适配
-(CGFloat)height:(CGFloat)oldHeight{
    CGFloat newheight;
//    if (kIPHONE4 || kIPHONE5){
//        newheight = oldHeight;
//    }else if (kIPHONE6){
//        newheight = oldHeight*667/480;
//    }else{
//        newheight = oldHeight*736/480;
//    }
    return newheight;
}

@end
