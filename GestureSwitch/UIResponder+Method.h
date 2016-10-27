//
//  UIResponder+Method.h
//  cangchudai
//
//  Created by ios05 on 15/11/17.
//  Copyright © 2015年 app. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (Method)

//设置label字体大小以及颜色
-(void)setString:(NSString *)string subString:(NSString *)subString label:(UILabel *)label start:(NSInteger)start andLength:(NSInteger)length;

//判断进度条状态
-(NSString *)progressTitleSettingIs_vouch:(NSString *)is_vouch status:(NSString *)status repayment_account:(NSString *)repayment_account repayment_yesaccount:(NSString *)repayment_yesaccount account:(NSString *)account statusFlag:(NSInteger)statusFlag andAccount_yes:(NSString *)account_yes;

//债权转让进度条判断
-(NSString *)progressTitleSettingStatus:(NSString *)status repayment_account:(NSString *)repayment_account repayment_yesaccount:(NSString *)repayment_yesaccount andStatusFlag:(NSInteger)statusFlag;

//去除小数点以及小数点后的数字
-(NSString *)removeDecimal:(NSString *)string;

//计算label的size
-(CGFloat)labelSize:(UILabel *)label;

//计算label的size
-(CGSize)labelSize:(UILabel *)label andString:(NSString *)string;

@end
