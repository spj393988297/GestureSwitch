//
//  MainViewController.m
//  GestureSwitch
//
//  Created by spj on 16/10/25.
//  Copyright © 2016年 spj All rights reserved.
//

#import "MainViewController.h"
#import "UIViewExt.h"
#import "GestureViewController.h"

//viewcontroller
#define kUISCREENWIDTH  [UIScreen mainScreen].bounds.size.width     //屏幕高度
#define kUISCREENHEIGHT [UIScreen mainScreen].bounds.size.height    //屏幕宽度


@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, kUISCREENWIDTH, 30)];
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.text = @"手势密码开关";
    titleLable.textColor = [UIColor grayColor];
    titleLable.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:titleLable];
    
    UIButton *changeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    changeButton.frame = CGRectMake(50, titleLable.bottom+50, kUISCREENWIDTH-100, 50);
    changeButton.backgroundColor = [UIColor redColor];
    changeButton.clipsToBounds = YES;
    changeButton.layer.cornerRadius = 5;
    [changeButton setTitle:@"手势密码修改" forState:UIControlStateNormal];
    [changeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [changeButton addTarget:self action:@selector(changeButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:changeButton];
    
    UIButton *canlceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    canlceButton.frame = CGRectMake(50, changeButton.bottom+50, kUISCREENWIDTH-100, 50);
    canlceButton.backgroundColor = [UIColor redColor];
    canlceButton.clipsToBounds = YES;
    canlceButton.layer.cornerRadius = 5;
    [canlceButton setTitle:@"手势密码删除" forState:UIControlStateNormal];
    [canlceButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [canlceButton addTarget:self action:@selector(cancleButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:canlceButton];
    
}

//点击进入手势界面
- (void)changeButtonAction
{
    GestureViewController *gesture = [[GestureViewController alloc] init];
    gesture.indexStr = @"1";
    [self presentViewController:gesture animated:YES completion:nil];
}
//删除手势
- (void)cancleButtonAction
{
    NSString *title;
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"gesture_mask"]) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"gesture_mask"];
        
        title = @"手势密码删除成功";
    }else{
        title = @"没有手势密码,请先开通";
    }
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alertView show];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
