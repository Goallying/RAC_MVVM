//
//  ViewControllerTarget.h
//  RAC_TEST
//
//  Created by 朱来飞 on 2018/3/29.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerTarget : NSObject

- (UIViewController *)initializePlayVC:(NSDictionary *)param ;

//回调参数名一定要是completion.
- (UIViewController *)initializePlayVC:(NSDictionary *)param completion:(void(^)(NSString * aString))string ;

- (UIViewController *)initializePlayVC ;
- (UIViewController *)initializePlayVCAndCompletion:(void(^)(NSString * aString))string;

@end
