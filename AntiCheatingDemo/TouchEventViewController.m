//
//  TouchEventViewController.m
//  AntiCheatingDemo
//
//  Created by leo on 2017/7/5.
//  Copyright © 2017年 leo. All rights reserved.
//

#import "TouchEventViewController.h"

@interface TouchEventViewController ()
@property (nonatomic,strong) UITextView *textview;
@property (nonatomic,strong) UIButton *tempBtn;
@end

@implementation TouchEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor =[UIColor whiteColor];
    _tempBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    _tempBtn.frame =CGRectMake(60.0f, 70.0f, 150.0f, 50.0f);
    [_tempBtn setTitle:@"open" forState:UIControlStateNormal];
    [_tempBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_tempBtn addTarget:self action:@selector(tempBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    _tempBtn.backgroundColor =[UIColor orangeColor];
    [self.view addSubview:_tempBtn];
    
    
    _textview =[[UITextView alloc] init];
    _textview.frame =CGRectMake(0.0f, 130.0f, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-100);
    _textview.font =[UIFont systemFontOfSize:13.0f];
    _textview.textColor =[UIColor blueColor];
    _textview.editable =NO;
    [self.view addSubview:_textview];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(testNotification:) name:@"TouchNotification" object:nil];
}

- (void)tempBtnAction:(id)sender{
    
    NSLog(@"click");
    
    UIButton *button =(UIButton *)sender;
    
    if (!button.selected)
    {
        button.selected =YES;
        button.backgroundColor =[UIColor brownColor];
    }else{
        button.selected =NO;
        button.backgroundColor =[UIColor orangeColor];
    }
    
}

- (void )testNotification:(NSNotification *)notification{
    [self logEvent:notification.userInfo[@"evinfo"]];
}

- (void)logEvent:(UIEvent *)ev {
    
    NSLog(@"Event : %@",ev);
    
    NSSet *allTouches = [ev allTouches];
    
    UITouch *touch1 = [allTouches anyObject];
    
    CGPoint locInSelf = [touch1 locationInView:[touch1 view]];
    CGPoint locInWin = [touch1 locationInView:[touch1 view]];
    float major = touch1.majorRadius;
    float majorToler = touch1.majorRadiusTolerance;
    
    
    NSLog(@"    touch.locationInView = {%2.3f, %2.3f}", locInSelf.x, locInSelf.y);
    NSLog(@"    touch.locationInWin = {%2.3f, %2.3f}", locInWin.x, locInWin.y);
    NSLog(@"    touch.phase = %ld", (long)touch1.phase);
    NSLog(@"    touch.tapCount = %lu", (unsigned long)touch1.tapCount);
    NSLog(@"major :%f",major);
    NSLog(@"majorToler : %f",majorToler);
    
    _textview.text =[NSString stringWithFormat:@"%@,\n touch.locationInView = {%2.3f, %2.3f} \n touch.locationInWin = {%2.3f, %2.3f} \n touch.phase = %ld \n major = %f \n majorToler = %f",_textview.text,locInSelf.x,locInSelf.y,locInWin.x,locInWin.y,touch1.phase,major,majorToler];
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
