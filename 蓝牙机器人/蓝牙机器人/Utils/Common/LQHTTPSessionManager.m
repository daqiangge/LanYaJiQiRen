//
//  LQHTTPSessionManager.m
//  lingdaozhe
//
//  Created by liqiang on 16/4/27.
//  Copyright © 2016年 bckj. All rights reserved.
//

#import "LQHTTPSessionManager.h"
#import "LCProgressHUD.h"

@implementation LQHTTPSessionManager

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (!self)
    {
        return nil;
    }
    
    // Requset 非JSON
    self.requestSerializer = [AFHTTPRequestSerializer serializer];
    // Response JSON
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    // Timte Out
    self.requestSerializer.timeoutInterval = 20;
    
    return self;
}

#pragma mark - Static Public
+ (instancetype)sharedManager
{
    static LQHTTPSessionManager *sessionManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sessionManager = [[LQHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:SERVER_URL]];
    });
    return sessionManager;
}

#pragma mark -
#pragma mark ================= Static Public =================
/**
 *  POST请求
 *
 *  @param URLString            请求地址
 *  @param parameters           请求参数
 *  @param showTips             请求等待提示
 *  @param success              成功
 *  @param successBackfailError 成功返回的错误信息
 *  @param failure              失败
 */
- (void)LQPost:(NSString *)URLString
   parameters:(id)parameters
     showTips:(NSString *)showTips
      success:(void (^)(id responseObject))success
successBackfailError:(void (^)(id responseObject))successBackfailError
      failure:(void (^)(NSError *error))failure
{
    if ([UtilString getNoNilString:showTips].length)
    {
        [LCProgressHUD showLoading:showTips];
    }
    
    DLog(@"\n===========POST===========\n%@:\n%@", URLString, parameters);
    
    [self POST:URLString
    parameters:parameters
       success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
           DLog(@"\n===========success===========\n%@:\n%@", URLString, responseObject);
           [self parsingRequestBack:responseObject sucess:success successBackfailError:successBackfailError];
       } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
           DLog(@"\n===========error===========\n%@:\n%@", URLString, error);
           [LCProgressHUD showFailure:@"加载失败"];
           failure(error);
       }];
}

/**
 *   上传文件请求
 *
 *  @param URLString               请求地址
 *  @param parameters              请求参数
 *  @param fileInfos               请求文件字典数组
 *  @param success                 请求成功
 *  @param successBackfailError    请求成功返回的错误信息
 *  @param failure                 请求失败
 */
- (void)LQPost:(NSString *)URLString
    parameters:(id)parameters
      fileInfo:(NSMutableArray *)fileInfos
      showTips:(NSString *)showTips
       success:(void (^)(id responseObject))success
successBackfailError:(void (^)(id responseObject))successBackfailError
       failure:(void (^)(NSError *error))failure
{
    if ([UtilString getNoNilString:showTips].length)
    {
        [LCProgressHUD showLoading:showTips];
    }
    
    DLog(@"\n===========POST===========\n%@:\n%@", URLString, parameters);
    
    [self POST:URLString
    parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        for (NSDictionary *fileInfo in fileInfos)
        {
            if (fileInfo) {
                [formData appendPartWithFileData:fileInfo[@"kFileData"]
                                            name:fileInfo[@"kName"]
                                        fileName:fileInfo[@"kFileName"]
                                        mimeType:fileInfo[@"kMimeType"]];
            }
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        DLog(@"\n===========success===========\n%@:\n%@", URLString, responseObject);
        [self parsingRequestBack:responseObject sucess:success successBackfailError:successBackfailError];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        DLog(@"\n===========error===========\n%@:\n%@", URLString, error);
        [LCProgressHUD showFailure:@"加载失败"];
        failure(error);
    }];
}

/**
 *  请求成功后的数据解析
 *
 *  @param url         地址
 *  @param params      参数
 *  @param sucessBlock 成功Block
 *  @param failBlock   失败Block
 *
 *  @return nil
 */
- (void)parsingRequestBack:(id)responseObject
                    sucess:(void (^)(id responseObject))success
      successBackfailError:(void (^)(id responseObject))successBackfailError
{
    BaseModel *baseModel = [BaseModel mj_objectWithKeyValues:responseObject];
    
    //    if (![responseObject valueForKey:@"state"])
    //    {
    //        NSLog(@"********************************");
    //        NSLog(@"******服务器返回数据错误********");
    //        NSLog(@"********************************");
    //
    //        [MBProgressHUD showErrorHUDAddedToView:Window
    //                                      errorStr:@"服务器返回数据错误"
    //                                      animated:YES
    //                                      showTime:TIPS_DELAY_TIME_NORMAL];
    //        return;
    //    }
    
    if(baseModel.state == 0)
    {
        [LCProgressHUD hide];
        success(baseModel.data);
        return;
    }
    
    if (baseModel.fieldErrors.count)
    {
        ModelFieldError *modelFieldError = [baseModel.fieldErrors firstObject];
        [LCProgressHUD showFailure:modelFieldError.message];
        
        successBackfailError(modelFieldError);
    }
}

@end
