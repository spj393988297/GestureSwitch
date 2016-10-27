//
//  UIResponder+Method.m
//  cangchudai
//
//  Created by ios05 on 15/11/17.
//  Copyright © 2015年 app. All rights reserved.
//

#import "UIResponder+Method.h"

@implementation UIResponder (Method)

//设置label字体大小以及颜色
-(void)setString:(NSString *)string subString:(NSString *)subString label:(UILabel *)label start:(NSInteger)start andLength:(NSInteger)length{
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
//    NSRange investMoneyRange = [string rangeOfString:subString];
//    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:kCELLCONTENTFONT] range:NSMakeRange(investMoneyRange.location+start, length)];
//    [attributedString addAttribute:NSForegroundColorAttributeName value:kBLACKCOLOR range:NSMakeRange(investMoneyRange.location+start, length)];
//    label.attributedText = attributedString;
}

//判断进度条状态
-(NSString *)progressTitleSettingIs_vouch:(NSString *)is_vouch status:(NSString *)status repayment_account:(NSString *)repayment_account repayment_yesaccount:(NSString *)repayment_yesaccount account:(NSString *)account statusFlag:(NSInteger)statusFlag andAccount_yes:(NSString *)account_yes{
    if ([is_vouch isEqualToString:@"1"]) {
        return @"担保完成";
    }
    
    if ([status isEqualToString:@"3"]){
        if ([repayment_account isEqualToString:repayment_yesaccount]) {
            return @" 已还完 ";
        }else{
            return @" 还款中 ";
        }
    }else if ([status isEqualToString:@"5"]){
        return @" 已取消 ";
    }else if ([status isEqualToString:@"4"]){
        return @"审核失败";
    }else if ([status isEqualToString:@"2"]){
        return @"等待复审";
    }else if (account.intValue > account_yes.intValue){
        if (statusFlag == 0) {
            return @"立即投标";
        }else{
            return @" 投标中 ";
        }
    }else {
        return @"等待复审";
    }
}

//债权转让进度条判断
-(NSString *)progressTitleSettingStatus:(NSString *)status repayment_account:(NSString *)repayment_account repayment_yesaccount:(NSString *)repayment_yesaccount andStatusFlag:(NSInteger)statusFlag{
    
    if ([status isEqualToString:@"1"]) {
        if (statusFlag == 0) {
            return @"立即投标";
        }else{
            return @" 投标中 ";
        }
    }else if ([status isEqualToString:@"2"]){
        if ([repayment_account isEqualToString:repayment_yesaccount]) {
            return @"已还完";
        }else{
            return @"转让成功";
        }
    }else{
        return @"审核失败";
    }
}

//去除小数点以及小数点后的数字
-(NSString *)removeDecimal:(NSString *)string{
    NSRange range = [string rangeOfString:@"."];
    
    if (range.location == NSNotFound) {
        return string;
    }else{
        return [string substringToIndex:range.location];
    }
}

//计算label的size
-(CGFloat)labelSize:(UILabel *)label{
    return [label.text boundingRectWithSize:CGSizeMake(label.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : label.font} context:nil].size.width;
}

//计算label的size
-(CGSize)labelSize:(UILabel *)label andString:(NSString *)string{
    CGSize size = [string boundingRectWithSize:CGSizeMake(label.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : label.font} context:nil].size;
    return size;
}

@end
