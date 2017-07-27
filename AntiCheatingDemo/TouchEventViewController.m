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
    
    UITouch *touch = [allTouches anyObject];
    
    CGPoint locInSelf = [touch locationInView:[touch view]];
    NSLog(@"    touch.locationInView = {%2.3f, %2.3f}", locInSelf.x, locInSelf.y);
    CGPoint locInWin = [touch locationInView:[touch view]];
    NSLog(@"    touch.locationInWin = {%2.3f, %2.3f}", locInWin.x, locInWin.y);
    float major = touch.majorRadius;
    NSLog(@"major :%f",major);
    float majorToler = touch.majorRadiusTolerance;
    NSLog(@"majorToler : %f",majorToler);
    NSLog(@"    touch.tapCount = %lu", (unsigned long)touch.tapCount);// 同一点触控次数 如： 单击 双击
    NSLog(@"touch.timestamp : %f",touch.timestamp); //触摸时间
    switch (touch.type) {
        case UITouchTypeDirect: //直接触摸屏幕
            NSLog(@"touch.type : UITouchTypeDirect");
            break;
        case UITouchTypeIndirect: //间接触摸屏幕
            NSLog(@"touch.type : UITouchTypeIndirect");
            break;
        case UITouchTypeStylus: // 笔触控
            NSLog(@"touch.type : UITouchTypeStylus");
            break;
        default:
            break;
    }
    NSLog(@"    touch.phase = %ld", (long)touch.phase);
  
    switch (touch.phase) {
        case UITouchPhaseBegan:  // 手指触摸表面
            NSLog(@"touch.phase : UITouchPhaseBegan");
            break;
        case UITouchPhaseMoved: // 手指在表面上移动
            NSLog(@"touch.phase : UITouchPhaseMoved");
            break;
        case UITouchPhaseStationary: // 手指长按或按下未离开表面
            NSLog(@"touch.phase : UITouchPhaseStationary");
            break;
        case UITouchPhaseEnded: // 手指离开表面
            NSLog(@"touch.phase : UITouchPhaseEnded");
            break;
        case UITouchPhaseCancelled: // 取消监控触摸
            NSLog(@"touch.phase : UITouchPhaseCancelled");
            break;
            
        default:
            break;
    }
    
    float force = [touch force]; // 触控力度
    NSLog(@"force : %f",force);
    float maximumPossibleForce = [touch maximumPossibleForce]; // 最大触控力度
    NSLog(@"maximumPossibleForce : %f",maximumPossibleForce);
    float altitudeAngle = [touch altitudeAngle];  // 书写弧度
    NSLog(@"altitudeAngle : %f",altitudeAngle);
    
    UITouchProperties estimatedProperties = touch.estimatedProperties; //
    NSLog(@"estimatedProperties : %ld",(long)estimatedProperties);
    
    UITouchProperties estimatedPropertiesExpectingUpdates = touch.estimatedPropertiesExpectingUpdates; //
    NSLog(@"estimatedPropertiesExpectingUpdates : %ld",(long)estimatedPropertiesExpectingUpdates);
    
    NSNumber *estimationUpdateIndex = touch.estimationUpdateIndex; //
    NSLog(@"estimationUpdateIndex : %@",estimationUpdateIndex);
    
    NSArray *gestureRecognizers = [touch gestureRecognizers]; //
    NSLog(@"gestureRecognizers : %@",gestureRecognizers);
    
    
    
    _textview.text =[NSString stringWithFormat:@"%@,\n touch.locationInView = {%2.3f, %2.3f} \n touch.locationInWin = {%2.3f, %2.3f} \n touch.phase = %ld \n major = %f \n majorToler = %f",_textview.text,locInSelf.x,locInSelf.y,locInWin.x,locInWin.y,touch.phase,major,majorToler];
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
