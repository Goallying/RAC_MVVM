//
//  View.m
//  RAC_TEST
//
//  Created by 朱来飞 on 2018/3/20.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "View.h"

@interface View()

@property (nonatomic ,strong)UIButton * btn ;
@property (nonatomic ,strong)UILabel * lb ;
@end

@implementation View

- (instancetype)initWithFrame:(CGRect)frame {
    
    if(self = [super initWithFrame:frame]){
        
        [self addSubview:self.btn];
        [self addSubview:self.lb];
    }
    return self ;
}
- (void)btnClick{
    
}

- (UILabel *)lb{
    if(_lb){
        _lb = [[UILabel alloc]initWithFrame:CGRectMake(10, 50, 100, 21)];
        _lb.textColor = [UIColor blackColor];
    }
    return _lb;
}
- (UIButton *)btn{
    if(!_btn){
        _btn = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 60, 30)];
        [_btn setTitle:@"click" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_btn setBackgroundColor:[UIColor yellowColor]];
        [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn ;
}
@end
