//
//  Model.h
//  RAC_TEST
//
//  Created by 朱来飞 on 2018/3/20.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Createor : NSObject

@property (nonatomic ,assign)NSInteger gender ;
@property (nonatomic ,copy)NSString * ID ;
@property (nonatomic ,assign)NSInteger level ;
@property (nonatomic ,copy)NSString * nick ;
@property (nonatomic ,copy)NSString  * portrait ;

@end

@interface Model : NSObject

@property (nonatomic ,strong)Createor * creator;

@property (nonatomic ,copy)NSString * ID ;
@property (nonatomic ,copy)NSString * name ;
@property (nonatomic ,copy)NSString * city ;
@property (nonatomic ,copy)NSString * share_addr ;
@property (nonatomic ,copy)NSString * stream_addr ;
@property (nonatomic ,assign)NSInteger version ;
@property (nonatomic ,assign)NSInteger  slot ;
@property (nonatomic ,copy)NSString * live_type ;
@property (nonatomic ,assign)NSInteger room_id ;

@end
