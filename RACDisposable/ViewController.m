//
//  ViewController.m
//  RACDisposable
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
    
//    [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//
//        [subscriber sendNext:@"sendText"];
//        return [RACDisposable disposableWithBlock:^{
//            NSLog(@"disposable");
//        }];
//    }] subscribeNext:^(id x) {
//        NSLog(@"receive === %@",x);
//    }];
    
    [[[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [subscriber sendNext:@"sendText"];
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"disposable");
        }];
    }] subscribeNext:^(id x) {
        NSLog(@"receive === %@",x);
    }]dispose];
}



@end
