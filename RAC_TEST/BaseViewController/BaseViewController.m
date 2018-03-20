//
//  BaseViewController.m
//  RAC_TEST
//
//  Created by 朱来飞 on 2018/3/20.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()


@end

@implementation BaseViewController

- (instancetype)initWithViewModel:(id)viewModel{
    if(self = [super init]){
        _viewModel = viewModel ;
    }
    return self ;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
