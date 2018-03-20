//
//  ViewModel.m
//  RAC_TEST
//
//  Created by 朱来飞 on 2018/3/20.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "ViewModel.h"
#import "Model.h"
@implementation ViewModel

- (instancetype)init{
    if(self = [super init]){
        [self setuplistDataCommand];
    }
    return self ;
}
- (NSString *)header:(NSIndexPath *)idx{
    
    Model * model = _lives[idx.item];
    return model.creator.portrait;
}
- (NSString *)name:(NSIndexPath *)idx{
    Model * model = _lives[idx.item];
    return model.creator.nick;
}
- (void)setuplistDataCommand{
    
    _dataCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(NSDictionary * input) {
        
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            
            [ReqManager GET_URLString:@"https://cityapi.inke.cn/api/home/city_live/info?session_id=1520423413&req_type=1&offset=0&zip=20&interest=0&lc=0000000000000089&cc=TG0001&cv=IK5.2.32_Iphone&proto=13&idfa=F6E705E3-D73A-4480-B629-34B9FB687C7E&idfv=1314F823-1152-448A-A611-2014E56947BF&devi=3220103782e749539b1346360a54c93899e7111a&osversion=ios_11.100000&ua=iPhone8_1&imei=&imsi=&uid=636853976&sid=202X6iPNEi4zDl2O52xduci0bi0NucqIQN8kmlkoQQveJuLg3tDNm&conn=wifi&mtid=c4ca4238a0b923820dcc509a6f75849b&mtxid=e4f3f504478&logid=271,213,226,244&smid=D27Ko+BBop1mQqp3TLUkoo0nDxnse6UF/KUG7BadHTvZ4X62&ast=1&s_sg=24a0ed93da831431a98075127a9f7235&s_sc=100&s_st=1520421642" parameters:nil showIndicatior:YES success:^(id obj) {
                
                NSArray * cards = obj[@"cards"];
                _lives = [NSMutableArray array];
                for (NSDictionary * dic in cards) {
                    NSDictionary * dataDic = dic[@"data"];
                    NSDictionary * liveInfoDic = dataDic[@"live_info"];
                     Model* live = [Model yy_modelWithDictionary:liveInfoDic];
                    [_lives addObject:live];
                }
                [subscriber sendNext:_lives];
                [subscriber sendCompleted];
            } failure:^(NSError *error) {
//                [subscriber sendNext:@"请求失败"];
                //no more send
                [subscriber sendError:error];
                [subscriber sendCompleted];
            }];
            return nil;
        }];
    }];
}

- (id)didSelectAtIndexPath:(NSIndexPath *)indexPath{
    Model * model = _lives[indexPath.item];
    return model.stream_addr ;
}

@end
