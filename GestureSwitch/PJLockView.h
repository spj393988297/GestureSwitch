//
//  PJLockView.h
//  cangchudai
//
//  Created by ios05 on 15/10/8.
//  Copyright (c) 2015年 app. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PJLockView;

@protocol PJLockViewDelegate <NSObject>

@optional
- (void)lockView:(PJLockView *)lockView didFinishPath:(NSString *)path;

@end

@interface PJLockView : UIView

@property (nonatomic,assign) id <PJLockViewDelegate> delegate;
@end
