//
//  ViewController.m
//  RACTimer
//
//  Created by 朱来飞 on 2018/3/19.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <ReactiveCocoa/RACEXTScope.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    @weakify(self);
    [[RACSignal interval:1 onScheduler:[RACScheduler mainThreadScheduler]] subscribeNext:^(id x) {
        @strongify(self);
        NSLog(@"timer == %@",x);
    }];
    
//    RAC(viewModel, time) = [[[RACSignal
//                              interval:60 onScheduler:[RACScheduler mainThreadScheduler] withLeeway:0]
//                             startWith:[NSDate date]]
//                            map:^(NSDate *date) {
//                                TTTTimeIntervalFormatter *timeIntervalFormatter = [[TTTTimeIntervalFormatter alloc] init];
//                                timeIntervalFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
//                                return [timeIntervalFormatter stringForTimeIntervalFromDate:date toDate:event.date];
//                            }];
}




@end
