//
//  ViewController.m
//  RACMap
//
//  Created by 朱来飞 on 2018/3/19.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <ReactiveCocoa/RACReturnSignal.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    RACSubject * subject = [RACSubject subject];
//    [[subject flattenMap:^__kindof RACSignal * _Nullable(id  _Nullable value) {
//        value = [NSString stringWithFormat:@"%@ 你别问我，我也不知道！",value];
//        return [RACReturnSignal return:value];
//    }] subscribeNext:^(id  _Nullable x) {
//        NSLog(@"%@",x);
//    }];
//    [subject sendNext:@"what happend？"];

    
    //
    [[subject map:^id _Nullable(id  _Nullable value) {
        return [NSString stringWithFormat:@"%@ 你别问我，我也不知道！",value];
    }] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];

    [subject sendNext:@"what happend？"];
    
}




@end
