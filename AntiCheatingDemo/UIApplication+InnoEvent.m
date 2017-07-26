//
//  UIApplication+InnoEvent.m
//  InnoSDK
//
//  Created by leo on 2017/5/8.
//  Copyright © 2017年 leo. All rights reserved.
//

#import "UIApplication+InnoEvent.h"
#import "InnoRuntime.h"

@implementation UIApplication(InnoEvent)


+(void)load {
    [self InnoSwizzleInstanceMethod:NSClassFromString(@"UIApplication") originSelector:@selector(sendEvent:) otherSelector:@selector(innoSwizzled_sendEvent:)];
}

- (void)innoSwizzled_sendEvent:(UIEvent *)event{
    [self innoSwizzled_sendEvent:event];
    
    if (event.type == UIEventTypeTouches) {
        
        NSDictionary *dict =@{@"evinfo":event};
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"TouchNotification" object:nil userInfo:dict];
    }
}









@end
