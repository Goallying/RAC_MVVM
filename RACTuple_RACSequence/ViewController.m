//
//  ViewController.m
//  RACTuple_RACSequence
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
    RACTuple *tuple = [RACTuple tupleWithObjects:@"大吉大利",@"今晚吃鸡",@66666,@99999, nil];
    [RACTuple tupleWithObjectsFromArray:@[@"大吉大利",@"今晚吃鸡",@66666,@99999]];
    [RACTuple tupleWithObjectsFromArray:@[@"大吉大利",@"今晚吃鸡",@66666,@99999] convertNullsToNils:YES];
    
    id value = tuple[0];
    id value2 = tuple.third;
    NSLog(@"%@ %@",value,value2);
    
    
    NSArray * array = @[@"大吉大利",@"今晚吃鸡",@66666,@99999];
    [array.rac_sequence.signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"array == %@",x);
    }];

    NSDictionary * dict = @{@"大吉大利":@"今晚吃鸡",
                            @"666666":@"999999",
                            @"dddddd":@"aaaaaa"
                            };
    
    [dict.rac_sequence.signal subscribeNext:^(RACTuple * _Nullable x) {
//        NSLog(@"key - %@ value - %@",x[0],x[1]);
        //
        RACTupleUnpack(NSString *key,id value) = x;
        NSLog(@"key - %@ value - %@",key,value);
    }];
    
//    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"Model.plist" ofType:nil];
//    NSArray * array = [NSArray arrayWithContentsOfFile:filePath];
//    //id  _Nullable value 这里的value就是NSDictionary 所以我们就改成NSDictionary
//    NSArray * persons = [[array.rac_sequence map:^id _Nullable(NSDictionary* value) {
//        return [Person personWithDict:value];
//    }] array];
//    
//    NSLog(@"%@",persons);

    
}
- (IBAction)refresh:(UIBarButtonItem *)sender {
}





@end
