//
//  PlayViewController.h
//  RAC_TEST
//
//  Created by 朱来飞 on 2018/3/20.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "BaseViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface PlayViewController : BaseViewController

@property (nonatomic ,copy)NSString * url ;
@property (nonatomic ,copy)void (^callBack)(NSString * aString) ;

@property (nonatomic ,strong)RACSubject * urlSignal ;

@end
