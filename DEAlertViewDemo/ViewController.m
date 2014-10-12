//
//  ViewController.m
//  DEAlertViewDemo
//
//  Created by Decade on 14/10/11.
//  Copyright (c) 2014年 decade. All rights reserved.
//

#import "ViewController.h"
#import "DEAlertView.h"

@interface ViewController ()
{
    UIButton *typebtn1;
    UIButton *typebtn2;
    UIButton *typebtn3;
    UIButton *typebtn4;
    UIButton *typebtn5;
    DEAlertView *alertview;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    typebtn1 = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-180/2, SCREEN_HEIGHT/6, 180, 50)];
    [typebtn1 setTitle:@"type_text" forState:UIControlStateNormal];
    typebtn1.backgroundColor = [UIColor orangeColor];
    typebtn1.layer.cornerRadius = 4;
    [typebtn1 addTarget:self action:@selector(type_text_view) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:typebtn1];

    typebtn2 = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-180/2, SCREEN_HEIGHT/6 + 70, 180, 50)];
    [typebtn2 setTitle:@"type_button_L" forState:UIControlStateNormal];
    typebtn2.backgroundColor = [UIColor orangeColor];
    typebtn2.layer.cornerRadius = 4;
    [typebtn2 addTarget:self action:@selector(type_btnl_view) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:typebtn2];
    
    typebtn3 = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-180/2, SCREEN_HEIGHT/6 + 70*2, 180, 50)];
    [typebtn3 setTitle:@"type_button_H" forState:UIControlStateNormal];
    typebtn3.backgroundColor = [UIColor orangeColor];
    typebtn3.layer.cornerRadius = 4;
    [typebtn3 addTarget:self action:@selector(type_btnh_view) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:typebtn3];
    
    typebtn4 = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-180/2, SCREEN_HEIGHT/6 + 70*3, 180, 50)];
    [typebtn4 setTitle:@"type_text_button" forState:UIControlStateNormal];
    typebtn4.backgroundColor = [UIColor orangeColor];
    typebtn4.layer.cornerRadius = 4;
    [typebtn4 addTarget:self action:@selector(type_textbtn_view) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:typebtn4];
    
    typebtn5 = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-180/2, SCREEN_HEIGHT/6 + 70*4, 180, 50)];
    [typebtn5 setTitle:@"type_text_field_button" forState:UIControlStateNormal];
    typebtn5.backgroundColor = [UIColor orangeColor];
    typebtn5.layer.cornerRadius = 4;
    [typebtn5 addTarget:self action:@selector(type_textfieldbtn_view) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:typebtn5];
}

-(void)type_text_view{
    UILabel *subview1 = [[UILabel alloc]init];
    subview1.text = @"⚠警告你警告我⚠";
    subview1.textAlignment = NSTextAlignmentCenter;
    
//    UIScrollView *subview2 = [[UIScrollView alloc]init];
//    subview2.backgroundColor = [UIColor greenColor];

    alertview = [[DEAlertView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-300/2, SCREEN_HEIGHT/2-150/2, 300, 150) BgColor:[UIColor colorWithHex:0xf0f1f4 alpha:1] Content:subview1 Buttons:nil];
    //    alertview.layer.cornerRadius = 6;
    [alertview show];
    //一号坑：如果要引用alertview的属性，请实例化以后再对content内容重新定义frame等属性
    subview1.frame = CGRectMake(0, alertview.frame.size.height/2-50/2, alertview.frame.size.width,50);
}

-(void)type_btnl_view{
    UIButton *btn1 = [[UIButton alloc]init];
    [btn1 setTitle:@"OK" forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor colorWithHex:0x769ee4 alpha:1];
    btn1.layer.cornerRadius =4;
    [btn1 addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];

    UIButton *btn2 = [[UIButton alloc]init];
    [btn2 setTitle:@"CANCEL" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor colorWithHex:0x1d1d1d alpha:1] forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor colorWithHex:0xffffff alpha:1];
    btn2.layer.cornerRadius =4;
    [btn2 addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
    //二号坑：Buttons为可变形参，输入完参数组后必须nil结束，要不会死循环。
    alertview = [[DEAlertView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-300/2, SCREEN_HEIGHT/2-150/2, 300, 150) BgColor:[UIColor colorWithHex:0xf0f1f4 alpha:1] Content:nil Buttons:btn1,btn2,nil];
    [alertview show];
    
    btn1.frame = CGRectMake(alertview.frame.size.width/2-100/2 - 60, alertview.frame.size.height/2-50/2, 100, 50);
    btn2.frame = CGRectMake(alertview.frame.size.width/2-100/2 + 60, alertview.frame.size.height/2-50/2, 100, 50);
}

-(void)type_btnh_view{
    UIButton *btn1 = [[UIButton alloc]init];
    [btn1 setTitle:@"OK" forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor colorWithHex:0x769ee4 alpha:1];
    btn1.layer.cornerRadius =4;
    [btn1 addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [[UIButton alloc]init];
    [btn2 setTitle:@"CANCEL" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor colorWithHex:0x1d1d1d alpha:1] forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor colorWithHex:0xffffff alpha:1];
    btn2.layer.cornerRadius =4;
    [btn2 addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
    alertview = [[DEAlertView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-300/2, SCREEN_HEIGHT/2-150/2, 300, 150) BgColor:[UIColor colorWithHex:0xf0f1f4 alpha:1] Content:nil Buttons:btn1,btn2,nil];
    [alertview show];
    
    btn1.frame = CGRectMake(alertview.frame.size.width/2-100/2, alertview.frame.size.height/2-50/2 -35, 100, 50);
    btn2.frame = CGRectMake(alertview.frame.size.width/2-100/2, alertview.frame.size.height/2-50/2 +35, 100, 50);
}

-(void)type_textbtn_view{
    UILabel *subview1 = [[UILabel alloc]init];
    subview1.text = @"⚠警告你警告我⚠";
    subview1.textAlignment = NSTextAlignmentCenter;
    
    UIButton *btn1 = [[UIButton alloc]init];
    [btn1 setTitle:@"OK" forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor colorWithHex:0x769ee4 alpha:1];
    btn1.layer.cornerRadius =4;
    [btn1 addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [[UIButton alloc]init];
    [btn2 setTitle:@"CANCEL" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor colorWithHex:0x1d1d1d alpha:1] forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor colorWithHex:0xffffff alpha:1];
    btn2.layer.cornerRadius =4;
    [btn2 addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
    alertview = [[DEAlertView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-300/2, SCREEN_HEIGHT/2-150/2, 300, 150) BgColor:[UIColor colorWithHex:0xf0f1f4 alpha:1] Content:subview1 Buttons:btn1,btn2,nil];
    [alertview show];
    
    btn1.frame = CGRectMake(alertview.frame.size.width/2-100/2 - 60, alertview.frame.size.height-60, 100, 50);
    btn2.frame = CGRectMake(alertview.frame.size.width/2-100/2 + 60, alertview.frame.size.height-60, 100, 50);
    subview1.frame = CGRectMake(0, 30, alertview.frame.size.width,50);
}

-(void)type_textfieldbtn_view{
    UILabel *subview1 = [[UILabel alloc]init];
    subview1.text = @"⚠警告你警告我⚠";
    subview1.textAlignment = NSTextAlignmentLeft;
    
    UITextField *textfield = [[UITextField alloc]init];
    textfield.backgroundColor = [UIColor whiteColor];
    textfield.keyboardType = UIKeyboardTypeNumberPad;
    
    UIView *cview = [[UIView alloc]init];

    UIButton *btn1 = [[UIButton alloc]init];
    [btn1 setTitle:@"OK" forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor colorWithHex:0x769ee4 alpha:1];
    btn1.layer.cornerRadius =4;
    [btn1 addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [[UIButton alloc]init];
    [btn2 setTitle:@"CANCEL" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor colorWithHex:0x1d1d1d alpha:1] forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor colorWithHex:0xffffff alpha:1];
    btn2.layer.cornerRadius =4;
    [btn2 addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
    alertview = [[DEAlertView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-300/2, SCREEN_HEIGHT/2-150/2, 300, 150) BgColor:[UIColor colorWithHex:0xf0f1f4 alpha:1] Content:cview Buttons:btn1,btn2,nil];
    [alertview show];
    
    [cview addSubview:textfield];
    [cview addSubview:subview1];
    cview.frame =CGRectMake(0, 0, alertview.frame.size.width, 150);
    
    btn1.frame = CGRectMake(alertview.frame.size.width/2-100/2 - 60, alertview.frame.size.height-60, 100, 50);
    btn2.frame = CGRectMake(alertview.frame.size.width/2-100/2 + 60, alertview.frame.size.height-60, 100, 50);
    
    subview1.frame = CGRectMake(40, 20, alertview.frame.size.width,20);
    textfield.frame = CGRectMake(40, 50, 200,25);
}

-(void)btnclick{
    NSLog(@"the button click is work!");
    [alertview dissmis];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
