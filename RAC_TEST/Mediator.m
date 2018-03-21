//
//  Mediator.m
//  RAC_TEST
//
//  Created by 朱来飞 on 2018/3/21.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "Mediator.h"
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
- (instancetype)init{
    if (self = [super init]) {
        _cache = [[NSMutableDictionary alloc]init];
    }
    return self ;
}
- (void)registeURLPattern:(NSString *)urlPattern handler:(componentBlock)blk{
    [_cache setObject:blk forKey:urlPattern];
}
- (void)openURL:(NSString *)url withParam:(id)param{
    componentBlock blk = [_cache objectForKey:url];
    if (blk) {
        blk(param);
    }
}
//

+ (void)goToDetail:(NSString *)ID{
    [[Mediator shared]openURL:@"RAC_Detail" withParam:@{@"ID":ID}];
}

@end
