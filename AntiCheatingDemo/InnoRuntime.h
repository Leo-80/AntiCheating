

#import <Foundation/Foundation.h>

@interface NSObject (InnoResolveNoMethod)

+ (void)InnoSwizzleClassMethod:(Class)class originSelector:(SEL)originSelector otherSelector:(SEL)otherSelector;
+ (void)InnoSwizzleInstanceMethod:(Class)class originSelector:(SEL)originSelector otherSelector:(SEL)otherSelector;

@end
