//
//  ViewController.m
//  RACSinal
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
    
    [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"发送消息"];
        return nil;
    }]subscribeNext:^(id x) {
        NSLog(@"接收消息 == %@",x);
    }];

    
}



@end
