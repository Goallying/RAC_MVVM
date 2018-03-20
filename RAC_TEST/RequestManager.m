//
//  RequestManager.m
//  App_iOS
//
//  Created by 朱来飞 on 2017/9/27.
//  Copyright © 2017年 上海递拎宝网络科技有限公司. All rights reserved.
//

#import "RequestManager.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import <AFNetworking/AFNetworking.h>

#define kWindow   [UIApplication sharedApplication].keyWindow

@implementation RequestManager {
    
    AFHTTPSessionManager * _sessionManager ;
}

+ (instancetype)manager {
    static RequestManager * _manager ;
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _manager = [[RequestManager alloc]init];
    });
    return _manager ;
}

-(instancetype)init{
    
    if (self = [super init]) {
        
        _sessionManager = [AFHTTPSessionManager manager];
        _sessionManager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        _sessionManager.securityPolicy.allowInvalidCertificates = YES;
        [_sessionManager.securityPolicy setValidatesDomainName:NO];
        _sessionManager.requestSerializer.timeoutInterval = 30 ;
        _sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"application/json",@"text/json",@"text/javascript",@"text/html", nil];
    }
    
    return self ;
}

-(void)POST_URLString:(NSString *)s
           parameters:(NSDictionary *)dic
       showIndicatior:(BOOL)showIndicatior
              success:(void (^)(id))success
              failure:(void (^)(NSError *))failure{
    [self POST_URLString:s
              parameters:dic
                 timeOut:0
          showIndicatior:showIndicatior
                 success:success
                 failure:failure];
    
}
- (void)POST_URLString:(NSString *)s
            parameters:(NSDictionary *)dic
               timeOut:(NSInteger)timeOut
        showIndicatior:(BOOL)showIndicatior
               success:(void(^)(id obj))success
               failure:(void(^)(NSError * error))failure{

    if (timeOut > 0) {
        _sessionManager.requestSerializer.timeoutInterval = timeOut ;
    }
    MBProgressHUD * _hud ;
    if (showIndicatior) {
        _hud.label.text = @"加载中...";
    }
    [_sessionManager POST:s parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        if (showIndicatior) {
            [_hud hideAnimated:YES];
        }
       !success?:success(responseObject) ;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (showIndicatior) {
            [_hud hideAnimated:YES];
        }
        !failure?:failure(error);
        
    }] ;
    
}

-(void)GET_URLString:(NSString *)s
          parameters:(NSDictionary *)dic
      showIndicatior:(BOOL)showIndicatior
             success:(void (^)(id))success
             failure:(void (^)(NSError *))failure{
    
    MBProgressHUD * _hud ;
    if (showIndicatior) {
        _hud = [MBProgressHUD showHUDAddedTo:kWindow animated:YES];
        _hud.label.text = @"加载中...";
    }
    
//    _sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
    [_sessionManager GET:s parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (showIndicatior) {
            [_hud hideAnimated:YES];
        }
        !success?:success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (showIndicatior) {
            [_hud hideAnimated:YES];
        }
        !failure?:failure(error) ;
    }];
}
#pragma mark -
#pragma mark --  UploadImages

-(void)uploadImagesURL:(NSString *)s images:(NSArray *)images params:(NSDictionary *)dic showIndicatior:(BOOL)showIndicatior success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    
    MBProgressHUD * _hud ;
    if (showIndicatior) {
        _hud = [MBProgressHUD showHUDAddedTo:kWindow animated:YES];
        _hud.label.text = @"加载中...";
    }
    [_sessionManager POST:s parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        for (int i = 0; i< images.count; i++) {
            UIImage *image = images[i];
//            NSData *data = UIImagePNGRepresentation(image);
            NSData * data = UIImageJPEGRepresentation(image, 0.83);
            [formData appendPartWithFileData:data name:@"picture" fileName:[NSString stringWithFormat:@"image%d.png",i] mimeType:@"image/*"];
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
//        NSLog(@"progress == %@",uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (showIndicatior) {
            [_hud hideAnimated:YES];
        }
       
        !success?:success(responseObject) ;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (showIndicatior) {
            [_hud hideAnimated:YES];
        }
        !failure?:failure(error) ;

    }];
}
- (void)downloadImagesByURLs:(NSArray *)imagesURLs success:(void (^)(NSArray *))success failure:(void (^)(void))failure{
    
    MBProgressHUD * _hud ;
    _hud = [MBProgressHUD showHUDAddedTo:kWindow animated:YES];
    _hud.label.text = @"加载中...";
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t defaultQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    NSMutableArray * images  = [NSMutableArray array];
    for (NSString * pic in imagesURLs) {
        dispatch_group_async(group, defaultQueue, ^{
            //直接下载大图
            NSData *data = [NSData dataWithContentsOfURL:[NSURL  URLWithString:pic]];
            UIImage *image = [UIImage imageWithData:data];
            if (image) {
                [images addObject:image];
            }
        });
    }
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        [_hud hideAnimated:YES];
        success(images);
    });
    
    
}
#pragma mark -
#pragma mark --  NetworkReachable
//- (BOOL)connected {
//
//    // 避免每次请求都需要验证网络是否可用，提高效率
//    if (AppManager.netType
//        &&((AppManager.netType == NetWorkConnect_Wifi)
//         ||(AppManager.netType == NetWorkConnect_WWAN))) {
//
//            return YES ;
//        }
//    // 第一次网络请求需要验证
//    return [self connectReachability];
//}
//- (BOOL)connectReachability {
//
//    Reachability * reach = [Reachability reachabilityWithHostName:@"https://www.baidu.com/"];
//    BOOL connected = NO ;
//    switch ([reach currentReachabilityStatus]) {
//        case NotReachable:{
//            connected = NO ;
//        }
//            break;
//        case ReachableViaWiFi:{
//           connected = YES ;
//        }
//            break;
//        case ReachableViaWWAN:{
//            connected = YES ;
//        }
//            break;
//        default:
//            break;
//    }
//
//    return connected ;
//}

- (void)cancelRequest{
    
    [_sessionManager.operationQueue cancelAllOperations];
}



@end
