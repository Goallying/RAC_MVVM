//
//  Mediator.m
//  RAC_TEST
//
//  Created by 朱来飞 on 2018/3/21.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "Mediator.h"
#import <CoreGraphics/CoreGraphics.h>

@interface Mediator()
@property (nonatomic ,strong)NSMutableDictionary * cache ;
@end

@implementation Mediator
typedef void (^componentBlock) (id param);

//life circle
+ (instancetype)shared{
    static Mediator * mediator ;
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        mediator = [[super allocWithZone:NULL]init];
    });
    return mediator ;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    return [self shared];
}
- (id)performTarget:(NSString *)target selector:(NSString *)sel parma:(NSDictionary *)param completion:(void(^)(id))completion{
    
    Class targetCls = NSClassFromString(target);
    SEL action = NULL ;
    if (param) {
    ////回调参数名一定要是completion.
        if (completion) {
            action =  NSSelectorFromString([NSString stringWithFormat:@"%@:completion:",sel]);

        }else{
            action =  NSSelectorFromString([NSString stringWithFormat:@"%@:",sel]);
        }
    }else{
        if (completion) {
            action =  NSSelectorFromString([NSString stringWithFormat:@"%@:",sel]);
        }else{
            action = NSSelectorFromString(sel);
        }
    }
    
    if (!targetCls) {
        @throw [NSException exceptionWithName:@"Target Not Found" reason:@"找不到相应的target class" userInfo:nil];
        return nil;
    }
    NSObject * targetObj = [[targetCls alloc] init];
    if ([targetObj respondsToSelector:action]) {
        return [self _performTarget:targetObj selector:action parma:param completion:completion];
    }else{
        @throw [NSException exceptionWithName:@"Selector Implement Not Found" reason:@"找不到方法实现" userInfo:nil];
    }
}

- (id)_performTarget:(NSObject *)target selector:(SEL)sel parma:(NSDictionary *)param completion:(void(^)(id))completion{
    
    NSMethodSignature * sign = [target methodSignatureForSelector:sel];
    if (!sign) {
        return nil ;
    }
    //返回值
    const char * ret = [sign methodReturnType];
    if (strcmp(ret, @encode(void)) == 0) {
        NSInvocation * invocation = [NSInvocation invocationWithMethodSignature:sign];
        if (!param && completion) {
            [invocation setArgument:&completion atIndex:2];
        }else{
            [invocation setArgument:&param atIndex:2];
            [invocation setArgument:&completion atIndex:3];
        }
        [invocation setTarget:target];
        [invocation setSelector:sel];
        [invocation invoke];
        return  nil ;
    }
    if (strcmp(ret, @encode(NSInteger)) == 0) {
        NSInvocation * invocation = [NSInvocation invocationWithMethodSignature:sign];
        if (!param && completion) {
            [invocation setArgument:&completion atIndex:2];
        }else{
            [invocation setArgument:&param atIndex:2];
            [invocation setArgument:&completion atIndex:3];
        }

        [invocation setTarget:target];
        [invocation setSelector:sel];
        [invocation invoke];
        
        NSInteger value = 0 ;
        [invocation getReturnValue:&value];
        return @(value) ;
    }
    if (strcmp(ret, @encode(BOOL)) == 0) {
        NSInvocation * invocation = [NSInvocation invocationWithMethodSignature:sign];
        if (!param && completion) {
            [invocation setArgument:&completion atIndex:2];
        }else{
            [invocation setArgument:&param atIndex:2];
            [invocation setArgument:&completion atIndex:3];
        }

        [invocation setTarget:target];
        [invocation setSelector:sel];
        [invocation invoke];
        
        BOOL value = 0 ;
        [invocation getReturnValue:&value];
        return @(value) ;
    }
    if (strcmp(ret, @encode(CGFloat)) == 0) {
        NSInvocation * invocation = [NSInvocation invocationWithMethodSignature:sign];
        if (!param && completion) {
            [invocation setArgument:&completion atIndex:2];
        }else{
            [invocation setArgument:&param atIndex:2];
            [invocation setArgument:&completion atIndex:3];
        }

        [invocation setTarget:target];
        [invocation setSelector:sel];
        [invocation invoke];
        
        CGFloat value = 0 ;
        [invocation getReturnValue:&value];
        return @(value) ;
    }
    if (strcmp(ret, @encode(NSUInteger)) == 0) {
        NSInvocation * invocation = [NSInvocation invocationWithMethodSignature:sign];
        if (!param && completion) {
            [invocation setArgument:&completion atIndex:2];
        }else{
            [invocation setArgument:&param atIndex:2];
            [invocation setArgument:&completion atIndex:3];
        }

        [invocation setTarget:target];
        [invocation setSelector:sel];
        [invocation invoke];
        
        NSUInteger value = 0 ;
        [invocation getReturnValue:&value];
        return @(value) ;
    }
    //对象
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    if (!param && completion) {
        return [target performSelector:sel withObject:completion];
    }else{
       return [target performSelector:sel withObject:param withObject:completion];
    }
#pragma clang diagnostic pop
    
}

@end
