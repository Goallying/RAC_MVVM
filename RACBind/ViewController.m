//
//  ViewController.m
//  RACBind
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
    RACSignal * sinal = [subject bind:^RACStreamBindBlock{
        
        return ^RACStream *(id value, BOOL *stop){
            
            // 什么时候调用block:当信号有新的值发出，就会来到这个block。
            // block作用:做返回值的处理
            // 做好处理，通过信号返回出去.
            return [RACReturnSignal return:[NSString stringWithFormat:@"输出:%@",value]];
        };
    }];
    [sinal subscribeNext:^(id x) {
        NSLog(@"==== %@" ,x);
    }];
    [subject sendNext:@"send Text"];
    
}
- (IBAction)refresh:(id)sender {
}




@end
