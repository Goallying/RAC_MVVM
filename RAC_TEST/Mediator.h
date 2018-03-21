//
//  Mediator.h
//  RAC_TEST
//
//  Created by 朱来飞 on 2018/3/21.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mediator : NSObject

+ (instancetype)shared;
+ (void)goToDetail:(NSString *)ID ;


@end
