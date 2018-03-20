//
//  ViewController.m
//  RACSubject_RACReplaySubject
//
//  Created by 朱来飞 on 2018/3/19.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //必须先订阅再发送消息
    RACSubject * subject = [RACSubject subject];
    [subject sendNext:@"send Message"];

    [subject subscribeNext:^(id x) {
        NSLog(@" receive === %@",x);
    }];
//    [subject sendNext:@"send Message"];
    
    RACReplaySubject * replay = [RACReplaySubject subject];
    [replay sendNext:@"replay Send Message"];
    [replay subscribeNext:^(id x) {
        NSLog(@"replay receive");
    }];
}


@end
