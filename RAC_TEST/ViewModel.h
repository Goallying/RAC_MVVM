//
//  ViewModel.h
//  RAC_TEST
//
//  Created by 朱来飞 on 2018/3/20.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "BaseViewModel.h"
#import "Table_Collection_View_Protocol.h"

@interface ViewModel : BaseViewModel<Table_Collection_View_Protocol>

@property (nonatomic ,strong,readonly)RACCommand * dataCommand ;
@property (nonatomic ,strong,readonly)NSMutableArray * lives ;

- (NSString *)name:(NSIndexPath*)idx ;
- (NSString *)header:(NSIndexPath *)idx ;
//@property (nonatomic ,strong)Model * model ;
@end
