//
//  ViewController.m
//  RACFilter
//
//  Created by 朱来飞 on 2018/3/19.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *TF;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //TF length >5 才输出
//    [[_TF.rac_textSignal filter:^BOOL(NSString * value) {
//      return value.length > 5 ;
//
//    }] subscribeNext:^(id x) {
//    NSLog(@"=== %@",x);;
//    }];
    
    
//    RACSubject * subject = [RACSubject subject];
//
//    [[subject ignore:@"a"] subscribeNext:^(id  _Nullable x) {
//        NSLog(@"%@",x);
//    }];
//
//    [subject sendNext:@"a"];
//    [subject sendNext:@"a1"];
//    [subject sendNext:@"b"];
    
//    RACSubject * subject = [RACSubject subject];
//    [[[[[subject ignore:@"1"] ignore:@"2"] ignore:@"3"] ignore:@"4"] subscribeNext:^(id  _Nullable x) {
//        NSLog(@"%@",x);
//    }];
//    [subject sendNext:@"1"];
//    [subject sendNext:@"2"];
//    [subject sendNext:@"3"];
//    [subject sendNext:@"4"];
//    [subject sendNext:@"5"];
    
//    RACSubject * subject = [RACSubject subject];
//
//    [[subject take:3] subscribeNext:^(id  _Nullable x) {
//        NSLog(@"%@",x); //123
//    }];
//
//    [subject sendNext:@"1"];
//    [subject sendNext:@"2"];
//    [subject sendNext:@"3"];
//    [subject sendNext:@"4"];
//    [subject sendNext:@"5"];
    
//    RACSubject * subject = [RACSubject subject];
//
//    [[subject takeLast:3] subscribeNext:^(id  _Nullable x) {
//        NSLog(@"%@",x); // 345.
//    }];
//    [subject sendNext:@"1"];
//    [subject sendNext:@"2"];
//    [subject sendNext:@"3"];
//    [subject sendNext:@"4"];
//    [subject sendNext:@"5"];
//    [subject sendCompleted];
    
//    RACSubject * subject = [RACSubject subject];
//    RACSubject * subject1 = [RACSubject subject];
//
////    takeUntil需要一个信号作为标记，当标记的信号发送数据，就停止。
//
//    [[subject takeUntil:subject1] subscribeNext:^(id  _Nullable x) {
//        NSLog(@"%@",x);
//    }];
//
//    [subject1 subscribeNext:^(id  _Nullable x) {
//        NSLog(@"%@",x);
//    }];
//
//    [subject sendNext:@"1"];
//    [subject sendNext:@"2"];
//    [subject sendNext:@"3"];
//
//    [subject1 sendNext:@"stop"];
//
//    [subject sendNext:@"4"];
//    [subject sendNext:@"5"];
  
    
//    distinctUntilChanged 剔除一样的信号
    RACSubject * subject = [RACSubject subject];
//    [[subject distinctUntilChanged] subscribeNext:^(id  _Nullable x) {
//        NSLog(@"%@",x);
//    }];
//    // 必须三个都相同？？？
//    [subject sendNext:@"x"];
//    [subject sendNext:@"xa"];
//    [subject sendNext:@"x"];
    
    [[subject distinctUntilChanged] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    
    // no model.
    [subject sendNext:@[@1]];
    [subject sendNext:@[@1]];
    
    [subject sendNext:@{@"name":@"jack"}];
    [subject sendNext:@{@"name":@"jack"}];
    
  
    
}

@end
