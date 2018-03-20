//
//  ViewController.m
//  RACMulticastConnection
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
    
//    RACSignal * sinal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        NSLog(@"sendRequest");
//        [subscriber sendNext:@"get json"];
//        return nil;
//    }];
//    [sinal subscribeNext:^(id x) {
//        NSLog(@"1== %@",x);
//    }];
//    [sinal subscribeNext:^(id x) {
//        NSLog(@"2== %@",x);
//
//    }];
//    [sinal subscribeNext:^(id x) {
//        NSLog(@"3== %@",x);
//
//    }];
    
    //防止多次请求
   RACSignal * sinal =  [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
       NSLog(@"请求");
       [subscriber sendNext:@"get json"];
       return nil ;
    }];
    RACMulticastConnection * mutiConnect = [sinal publish];
    [mutiConnect.signal subscribeNext:^(id x) {
        NSLog(@"1== %@",x);
    }];
    [mutiConnect.signal subscribeNext:^(id x) {
        NSLog(@"2== %@",x);
    }];
    [mutiConnect.signal subscribeNext:^(id x) {
        NSLog(@"3== %@",x);
    }];
    [mutiConnect connect];
    
}




@end
