//
//  PlayViewController.m
//  RAC_TEST
//
//  Created by 朱来飞 on 2018/3/20.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "PlayViewController.h"

@interface PlayViewController ()

@end

@implementation PlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
        
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(10, 100, 60, 30)];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
}
- (void)click {
    
    if (self.callBack) {
        self.callBack(@"ssssssss");
    }
    [_urlSignal sendNext:@"RAC Send TEXT"];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (RACSubject *)urlSignal{
    if (!_urlSignal) {
        _urlSignal = [RACSubject subject];
    }
    return _urlSignal ;
}



@end
