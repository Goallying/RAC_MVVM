//
//  BaseViewController.h
//  RAC_TEST
//
//  Created by 朱来飞 on 2018/3/20.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface BaseViewController : UIViewController



- (instancetype)initWithViewModel:(id)viewModel ;
@property (nonatomic ,strong,readonly)id viewModel;

@end
