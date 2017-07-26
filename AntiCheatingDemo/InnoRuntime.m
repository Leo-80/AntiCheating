
#import "InnoRuntime.h"
#import <objc/runtime.h>
#import <Foundation/NSObject.h>
#import <Foundation/NSEnumerator.h>
#import <Foundation/NSRange.h>
#import <Foundation/NSObjCRuntime.h>

#pragma mark - ---- NSObject

@implementation NSObject (InnoResolveNoMethod)

#pragma mark - swizzle method

+ (void)InnoSwizzleClassMethod:(Class)class originSelector:(SEL)originSelector otherSelector:(SEL)otherSelector{
    [self InnoSwizzleInstanceMethod:object_getClass(self) originSelector:originSelector otherSelector:otherSelector];
}

+ (void)InnoSwizzleInstanceMethod:(Class)class originSelector:(SEL)originSelector otherSelector:(SEL)otherSelector{
    Method otherMehtod = class_getInstanceMethod(class, otherSelector);
    Method originMehtod = class_getInstanceMethod(class, originSelector);
    
    BOOL didAddMethod =
    class_addMethod(class,
                    originSelector,
                    method_getImplementation(otherMehtod),
                    method_getTypeEncoding(otherMehtod));
    if (didAddMethod) {
        class_replaceMethod(class,otherSelector,method_getImplementation(originMehtod), method_getTypeEncoding(originMehtod));
    }else {
        // 交换2个方法的实现
        method_exchangeImplementations(otherMehtod, originMehtod);
    }
}

@end





