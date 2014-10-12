//
//  DEAlertView.h
//  DEAlertViewDemo
//
//  Created by Decade on 14/10/11.
//  Copyright (c) 2014年 decade. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - #my class# UIColorWithHex
@interface UIColor (withhex)
+ (UIColor*) colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
@end

@implementation UIColor (withhex)

+ (UIColor*) colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
}
@end

#pragma mark #my class#  -

@interface DEAlertView : UIView
{
    UIControl *shadow;
}
@property (nonatomic, readwrite) CGRect mframe;
@property (nonatomic, readwrite) CGRect oframe;

-(DEAlertView *)initWithFrame:(CGRect)frame BgColor:(UIColor *)bgcolor Content:(UIView *)content Buttons:(UIButton *)button,...;

-(void)show;
-(void)dissmis;
@end
