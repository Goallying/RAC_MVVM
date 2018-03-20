//
//  RequestManager.h
//  App_iOS
//
//  Created by 朱来飞 on 2017/9/27.
//  Copyright © 2017年 上海递拎宝网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>


#ifndef ReqManager
#define ReqManager  [RequestManager manager]
#endif

@interface RequestManager : NSObject


+(instancetype)manager ;

- (void)POST_URLString:(NSString *)s
            parameters:(NSDictionary *)dic
        showIndicatior:(BOOL)showIndicatior
               success:(void(^)(id obj))success
               failure:(void(^)(NSError * error))failure ;

- (void)GET_URLString:(NSString *)s
            parameters:(NSDictionary *)dic
        showIndicatior:(BOOL)showIndicatior
               success:(void(^)(id obj))success
               failure:(void(^)(NSError * error))failure ;
//自定义超时时间请求
- (void)POST_URLString:(NSString *)s
            parameters:(NSDictionary *)dic
               timeOut:(NSInteger)timeOut
        showIndicatior:(BOOL)showIndicatior
               success:(void(^)(id obj))success
               failure:(void(^)(NSError * error))failure ;

// 上传图片
- (void)uploadImagesURL:(NSString *)s
                 images:(NSArray *)images
              params:(NSDictionary *)dic
      showIndicatior:(BOOL)showIndicatior
             success:(void(^)(id obj))success
             failure:(void(^)(NSError * error))failure ;

- (void)downloadImagesByURLs:(NSArray *)imagesURLs success:(void (^)(NSArray *))success failure:(void (^)(void))failure;
//取消请求
- (void)cancelRequest ;
@end
