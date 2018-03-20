//
//  ViewController.m
//  RACCommand
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
    
    RACCommand * command = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {

        NSLog(@"inut == %@",input);
        //nonull.
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            [subscriber sendNext:@"send Text"];
            [subscriber sendCompleted];
            return nil;
        }];
    }];

    //easyiest.
//    [[command execute:@"command excute"] subscribeNext:^(id x) {
//        NSLog(@"receive what == %@",x);
//    }];

//    [command.executionSignals subscribeNext:^(id x) {
//        NSLog(@"excuting what == %@", x); // a sinal.
//    }];
//    [command.executionSignals subscribeNext:^(id x) {
//        [x subscribeNext:^(id y) {
//            NSLog(@"what's fuck == %@",y);//RACCommand[10228:169352] what's fuck == send Text
//
//        }];
//    }];
    [command.executionSignals.switchToLatest subscribeNext:^(id x) {
        NSLog(@"??? what's more == %@",x);////RACCommand[10228:169352] what's fuck == send Text
    }];
    
    [command.executing subscribeNext:^(id x) {
        NSLog(@"excut== %@",x);

        //两个问题。1：进来就执行完成， 2.没有结束。（先完成，在执行中，无后续操作？？）
        if([x boolValue]){
            NSLog(@"执行中");
        }else{
            NSLog(@"执行结束");
        }
    }];
//    [[command.executing skip:1] subscribeNext:^(NSNumber * x) {
//        NSLog(@"excuteX== %@",x);
//
//        //两个问题。1：进来就执行完成， 2.没有结束。（先完成，在执行中，无后续操作？？）
//        if([x boolValue]){
//            NSLog(@"执行中");
//        }else{
//            NSLog(@"执行结束");
//        }
//    }];
    [command execute:@"command excute"];
    //filter过滤某些
//    ignore忽略某些值
//    startWith从哪里开始
//    skip跳过（忽略）次数
//    take取几次值 正序
//    takeLast取几次值 倒序
    

    
    //--------------------------------
    //TODO:SinalOfSinal.
    RACSubject * sinalOfSinal = [RACSubject subject];
    RACSubject * sinal0 = [RACSubject subject];
//
////    [sinalOfSinal subscribeNext:^(id x) {
////        [x subscribeNext:^(id y) {
////            NSLog(@"==== %@",y);
////        }];
////    }];
//
//    [sinalOfSinal.switchToLatest subscribeNext:^(id x) {
//        NSLog(@"==== %@",x);
//    }];
    
    //构建新映射
    [[sinalOfSinal flattenMap:^__kindof RACSignal * _Nullable(id  _Nullable value) {
        return value;
    }] subscribeNext:^(id  _Nullable x) {
        NSLog(@"sinal of sinal == %@",x);
    }];
    
    [sinalOfSinal sendNext:sinal0];
    [sinal0 sendNext:@"mmp"];
}

@end
