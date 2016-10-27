//
//  GestureViewController.m
//  GestureSwitch
//
//  Created by spj on 16/10/25.
//  Copyright © 2016年 spj All rights reserved.
//

#import "GestureViewController.h"
#import "GestureView.h"
#import "MainViewController.h"

//viewcontroller
#define kUISCREENWIDTH  [UIScreen mainScreen].bounds.size.width     //屏幕高度
#define kUISCREENHEIGHT [UIScreen mainScreen].bounds.size.height    //屏幕宽度
@interface GestureViewController ()<PJLockViewDelegate>

@property (nonatomic, strong) GestureView *gestureView;
@property (nonatomic, strong) NSMutableArray *passWordArray;

@end

@implementation GestureViewController

- (NSMutableArray *)passWordArray
{
    if(!_passWordArray){
        _passWordArray = [[NSMutableArray alloc]init];
    }
    return _passWordArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //1.添加view
    _gestureView = [[GestureView alloc] initWithFrame:CGRectMake(0, 0, kUISCREENWIDTH, kUISCREENHEIGHT)];
    _gestureView.indexStr = self.indexStr;
    [_gestureView loadUI];
    [self.view addSubview:_gestureView];
    
    //2.添加点击事件
    [self clicButton];
    
    //3.代理
    _gestureView.lockView.delegate = self;
}

//2.添加点击事件
- (void)clicButton
{
    if (![self.indexStr isEqualToString:@"1"]) {
        [_gestureView.cancleButton setTitle:@"忘记密码，请登录" forState:UIControlStateNormal];
    }
    
    [_gestureView.cancleButton addTarget:self action:@selector(cancleButton) forControlEvents:UIControlEventTouchUpInside];
}
- (void)cancleButton
{
    if (![self.indexStr isEqualToString:@"1"]) {
        UIWindow *window = [[UIApplication sharedApplication] keyWindow];
        window.rootViewController = [[MainViewController alloc] init];
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];

    }
}

#pragma mark -PJLockViewDelegate
- (void)lockView:(PJLockView *)lockView didFinishPath:(NSString *)path
{
    NSLog(@"path is %@",path);
    if (path.length>0) {
        
        if ([self.indexStr isEqualToString:@"1"]) {//修改
            
            [self.passWordArray addObject:path];
            if (self.passWordArray.count==1) {
                _gestureView.titleLable.text = @"请在次绘制手势密码";
            }else {
                if (![[self.passWordArray objectAtIndex:0] isEqualToString:[self.passWordArray lastObject]]) {
                    _gestureView.titleLable.text = @"请与第一次手势密码一致";
                }else{
                    //成功
                    [[NSUserDefaults standardUserDefaults] setObject:[self.passWordArray objectAtIndex:0] forKey:@"gesture_mask"];
                    [self dismissViewControllerAnimated:YES completion:nil];
                }
            }
            
        }else{//登录
            NSString *gesture_mask = [[NSUserDefaults standardUserDefaults] objectForKey:@"gesture_mask"];
            if ([gesture_mask isEqualToString:path]) {
                UIWindow *window = [[UIApplication sharedApplication] keyWindow];
                window.rootViewController = [[MainViewController alloc] init];
            }else{
                _gestureView.titleLable.text = @"输入错误，请重新绘制手势密码";
            }
        }
        
    }
    
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
