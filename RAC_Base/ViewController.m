//
//  ViewController.m
//  RAC_Base
//
//  Created by 朱来飞 on 2018/3/19.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *TF1;
@property (weak, nonatomic) IBOutlet UITextField *TF2;
@property (strong, nonatomic)UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _btn = [[UIButton alloc]initWithFrame:CGRectMake(10, 300,100 ,30)];
    _btn.backgroundColor = [UIColor yellowColor];
    [_btn setTitle:@"click" forState:UIControlStateNormal];
    [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    
    
    //    [self combineLatest];
    //    [self zip];
    //    [self merge];
    //    [self then];
    [self concat];
}
- (void)concat {
    // concat----- 使用需求：有两部分数据：想让上部分先执行，完了之后再让下部分执行（都可获取值）

    RACSignal * sinalA = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSLog(@"AFN - AAAAA");
        [subscriber sendNext:@"A Json"];
        [subscriber sendCompleted];
        return nil ;
    }];
    RACSignal * sinalB = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSLog(@"AFN - BBBBB");
        [subscriber sendNext:@"B Json"];
        [subscriber sendCompleted];
        return nil ;
    }];
    [[sinalA concat:sinalB] subscribeNext:^(id x) {
        NSLog(@"concat == %@",x);
    }];
    
}
- (void)then {
    
    //    then --- 使用需求：有两部分数据：想让上部分先进行网络请求但是过滤掉数据，然后进行下部分的，拿到下部分数据
    RACSignal * sinalA = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSLog(@"AFN - AAAAA");
        [subscriber sendNext:@"A Json"];
        [subscriber sendCompleted];
        return nil ;
    }];
    RACSignal * sinalB = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSLog(@"AFN - BBBBB");
        [subscriber sendNext:@"B Json"];
        [subscriber sendCompleted];
        return nil ;
    }];
    RACSignal * thenSignal = [sinalA then:^RACSignal *{
        return sinalB ;
    }] ;
    [thenSignal subscribeNext:^(id x) {
        NSLog(@"then == %@",x);
    }];
}
- (void)merge {
    
    // 任何一个信号请求完成都会被订阅到
    // merge:多个信号合并成一个信号，任何一个信号有新值就会调用
    RACSubject * subA = [RACSubject subject];
    RACSubject * subB = [RACSubject subject];
    [[RACSignal merge:@[subA ,subB]] subscribeNext:^(id x) {
        NSLog(@"merge == %@",x);
    }];
    [subA sendNext:@"A"];
    //    [subB sendNext:@"B"];
}
- (void)zip {
    
    //zipWith:把两个信号压缩成一个信号，只有当两个信号同时发出信号内容时，并且把两个信号的内容合并成一个元祖，才会触发压缩流的next事件。
    
    RACSubject * subA = [RACSubject subject];
    RACSubject * subB = [RACSubject subject];
    RACSubject * zip = [subA zipWith:subB];
    [zip subscribeNext:^(id x) {
        NSLog(@" === %@",x);
    }];
    [subA sendNext:@"A"];
    //    [subB sendNext:@"B"];
    
}

- (void)combineLatest {
    
    RACSignal * sinal =  [RACSignal combineLatest:@[_TF1.rac_textSignal ,_TF2.rac_textSignal] reduce:^id(NSString * account ,NSString * psw){
        NSLog(@"count == %@ , psw == %@",account, psw);
        return @(account.length && psw.length);
    }];
    RAC(_btn ,enabled)  = sinal ;
}
- (void)btnClick {
    
    NSLog(@"===click");
}



@end

