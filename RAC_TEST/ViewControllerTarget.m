//
//  ViewControllerTarget.m
//  RAC_TEST
//
//  Created by 朱来飞 on 2018/3/29.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "ViewControllerTarget.h"

#import "PlayViewController.h"

@implementation ViewControllerTarget

- (UIViewController *)initializePlayVC:(NSDictionary *)param{
    
    PlayViewController * playVC = [PlayViewController new];
    playVC.url = param[@"URL"];
    return playVC ;
}

- (UIViewController *)initializePlayVC:(NSDictionary *)param completion:(void (^)(NSString *))string{
    
    PlayViewController * playVC = [PlayViewController new];
    playVC.url = param[@"URL"];
    [playVC setCallBack:^(NSString *aString) {
        if (string) {
            string(aString);
        }
    }];
    return playVC ;
}
- (UIViewController *)initializePlayVC {
    PlayViewController * playVC = [PlayViewController new];
    return playVC ;
}
- (UIViewController *)initializePlayVCAndCompletion:(void(^)(NSString * aString))string{
    
    PlayViewController * playVC = [PlayViewController new];
    [playVC setCallBack:^(NSString *aString) {
        if (string) {
            string(aString);
        }
    }];
    return playVC ;
}
@end
