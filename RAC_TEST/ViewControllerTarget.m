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

@end
