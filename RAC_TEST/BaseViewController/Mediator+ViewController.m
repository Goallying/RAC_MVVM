//
//  Mediator+ViewController.m
//  RAC_TEST
//
//  Created by 朱来飞 on 2018/3/30.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "Mediator+ViewController.h"
#import <UIKit/UIKit.h>

@implementation Mediator (ViewController)

- (void)pushToPlayVC:(NSDictionary *)param completion:(void (^)(id))completion{
    
    UIViewController * vc = [[Mediator shared]performTarget:@"ViewControllerTarget" selector:@"initializePlayVCAndCompletion" parma:nil completion:^(id obj) {
        if (completion) {
            completion(obj);
        }
    }];
    UINavigationController * nav = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    [nav pushViewController:vc animated:YES];
    
}

@end
