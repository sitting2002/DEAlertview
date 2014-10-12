//
//  DEAlertView.m
//  DEAlertViewDemo
//
//  Created by Decade on 14/10/11.
//  Copyright (c) 2014年 decade. All rights reserved.
//

#import "DEAlertView.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@implementation DEAlertView

-(DEAlertView *)initWithFrame:(CGRect)frame BgColor:(UIColor *)bgcolor Content:(UIView *)content Buttons:(UIButton *)button,...{
    if (self = [super init]) {
        self.backgroundColor = bgcolor;
        self.frame = CGRectMake(frame.origin.x, SCREEN_HEIGHT, frame.size.width, frame.size.height);
        self.oframe = self.frame;
        self.mframe = frame;
        if (content) {
            [self addSubview:content];
        }
    
        va_list btnlist;
        if (button) {
            [self addSubview:button];
            va_start(btnlist, button);
            UIButton *btns = va_arg(btnlist, id);
            while (btns) {
                [self addSubview:btns];
                btns = va_arg(btnlist, id);
            }
            va_end(btnlist);
        }
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    }
    return self;
}



-(void)show{
    NSLog(@"DEAlertView show!!!");
    shadow = [[UIControl alloc]init];
    shadow.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    shadow.backgroundColor = [UIColor colorWithHex:0x333333 alpha:0.5];
    shadow.alpha = 0;
    [shadow addSubview:self];
    shadow.tag = 1001;
    [UIView animateWithDuration:0.27 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        shadow.alpha = 1;
        self.frame = self.mframe;
    } completion:^(BOOL finished) {
    }];
    [shadow addTarget:self action:@selector(dissmis) forControlEvents:UIControlEventTouchUpInside];
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    [topVC.view addSubview:shadow];
}

-(void)dissmis{
    [UIView animateWithDuration:0.27 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        shadow.alpha = 0;
        self.frame = self.oframe;
    } completion:^(BOOL finished) {
        UIView *view1 = [[UIApplication sharedApplication].keyWindow.rootViewController.view viewWithTag:1001];
        [self removeFromSuperview];
        [view1 removeFromSuperview];
        [[NSNotificationCenter defaultCenter]removeObserver:self];
    }];
    NSLog(@"DEAlertView dissmis!!!");
}


-(void)keyboardWillShow:(NSNotification*)notification{
    NSDictionary*info=[notification userInfo];
    CGSize kbSize=[[info objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue].size;
    
    if (self)
    {
        [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            if (SCREEN_HEIGHT > 1000 || SCREEN_HEIGHT == 568) {
                self.frame = CGRectMake(self.mframe.origin.x, kbSize.height - 75, self.mframe.size.width, self.mframe.size.height);
            }
            else{
                self.frame = CGRectMake(self.mframe.origin.x, kbSize.height - 75 *2, self.mframe.size.width, self.mframe.size.height);
            }
        }completion:nil];
    }
}



@end
