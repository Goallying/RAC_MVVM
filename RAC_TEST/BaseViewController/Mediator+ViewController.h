//
//  Mediator+ViewController.h
//  RAC_TEST
//
//  Created by 朱来飞 on 2018/3/30.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "Mediator.h"

@interface Mediator (ViewController)

- (void)pushToPlayVC:(NSDictionary *)param completion:(void(^)(id aObj))completion ;

@end
