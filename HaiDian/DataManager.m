//
//  DataManager.m
//  enrichall
//
//  Created by xiaoling on 15-4-22.
//  Copyright (c) 2015年 万高杰. All rights reserved.
//

#import "DataManager.h"
#import "CompressionPhoto.h"

@implementation DataManager

+ (DataManager *)sharedManager
{
    static DataManager *manager = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        manager = [[DataManager alloc] init];
        manager.taskDic = [[NSMutableDictionary alloc] init];
    });
    return manager;
}

//进行上传照片
- (void)requestWithUrl:(NSString *)url withkey:(NSString *)key withParameters:(id)parameter withImage:(UIImage *)image withRequestSerilize:(int)serialize withBlock:(ImageReturn)imageMessage
{
    BOOL startTask = [self taskSessionStartWithURL:url];
    if(!startTask)//如果任务不能开始
    {
        NSLog(@"任务正在进行");
        return;
    }
    NSData *data = [CompressionPhoto getFinialDataWithImage:image];
    AFHTTPRequestOperationManager *mananger = [AFHTTPRequestOperationManager manager];
    [self initHttps:mananger withUrl:url];
    [self getSerializeWithNumber:serialize withManager:mananger];
    [mananger.requestSerializer setTimeoutInterval:15];//超时时间
    [mananger POST:url parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:data name:@"res" fileName:[NSString stringWithFormat:@"%@.jpeg",[self  getNowDate]] mimeType:@"image/jpeg"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"success%@", responseObject);
        imageMessage(responseObject);
        [self taskSessionEndWithURL:url];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
        [self taskSessionEndWithURL:url];
    }];
    

}

//进行大量图片上传照片
- (void)requestWithUrl:(NSString *)url withkey:(NSString *)key withParameters:(id)parameter withImageArr:(NSArray *)imageArr withRequestSerilize:(int)serialize withBlock:(ImageReturn)imageMessage
{
    BOOL startTask = [self taskSessionStartWithURL:url];
    if(!startTask)//如果任务不能开始
    {
        NSLog(@"任务正在进行");
        return;
    }
    AFHTTPRequestOperationManager *mananger = [AFHTTPRequestOperationManager manager];
    [self initHttps:mananger withUrl:url];
    [self getSerializeWithNumber:serialize withManager:mananger];
    [mananger.requestSerializer setTimeoutInterval:15];//超时时间
    [mananger POST:url parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        for(int i = 0; i < imageArr.count; i++)
        {
            NSData *data = [CompressionPhoto getFinialDataWithImage:imageArr[i]];
            [formData appendPartWithFileData:data name:@"res" fileName:[NSString stringWithFormat:@"%@%d.jpeg", [self getNowDate],i] mimeType:@"image/jpeg"];
        }
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"success%@", responseObject);
        [self taskSessionEndWithURL:url];
        imageMessage(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
        [self taskSessionEndWithURL:url];
    }];
}

//正常的访问
- (void)PostWithUrl:(NSString *)url withkey:(NSString *)key withParameters:(id)parameter withRequestSerilize:(int)serialize withBlock:(block)block withFailBlock:(failureBlock)failureBlock
{
    BOOL startTask = [self taskSessionStartWithURL:url];
    if(!startTask)//如果任务不能开始
    {
        NSLog(@"任务正在进行");
        return;
    }
    AFHTTPRequestOperationManager *mananger = [AFHTTPRequestOperationManager manager];
    
    [mananger.requestSerializer setValue:@"Haidian_iOS_Client" forHTTPHeaderField:@"User_Agent"];
    
    [self initHttps:mananger withUrl:url];
    [self getSerializeWithNumber:serialize withManager:mananger];
    [mananger.requestSerializer setTimeoutInterval:30];//超时时间
    [mananger POST:url parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        block(operation,responseObject);
        [self taskSessionEndWithURL:url];

    } failure:^(AFHTTPRequestOperation * operation, NSError *error) {
        NSLog(@"%@",error);
        failureBlock(error);
        [self taskSessionEndWithURL:url];
    }];
}

- (void)GetWithUrl:(NSString *)url withkey:(NSString *)key withRequestSerilize:(int)serialize withSuccessSBlock:(block)block withFailBlock:(failureBlock)failure
{
    BOOL startTask = [self taskSessionStartWithURL:url];
    if(!startTask)//如果任务不能开始
    {
        NSLog(@"任务正在进行");
        return;
    }
    AFHTTPRequestOperationManager *mananger = [AFHTTPRequestOperationManager manager];
    [self initHttps:mananger withUrl:url];
   [self getSerializeWithNumber:serialize withManager:mananger];
    [mananger.requestSerializer setTimeoutInterval:30];//超时时间
     NSString *utfString = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
     [mananger GET:utfString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
         block(operation,responseObject);
         [self taskSessionEndWithURL:url];

     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"%@",error);
         failure(error);
         [self taskSessionEndWithURL:url];
     }];
    
}

//taskDic判断是否有任务进程重叠
- (BOOL)taskSessionStartWithURL:(NSString *)url//是否开始
{
    if(![_taskDic objectForKey:url])
    {
        [_taskDic setObject:@"task" forKey:url];
        return YES;//开始下载
    }
    return NO;
}

- (void)taskSessionEndWithURL:(NSString *)url//失败或者成功后调用
{
    [_taskDic removeObjectForKey:url];
}

//https
- (void)initHttps:(AFHTTPRequestOperationManager *)manager withUrl:(NSString *)url
{
    if([self iSHttps:url])
    {
        AFSecurityPolicy * securityPolicy = [AFSecurityPolicy defaultPolicy];
        securityPolicy.allowInvalidCertificates = YES;
        manager.securityPolicy = securityPolicy;
    }
}

- (BOOL)iSHttps:(NSString *)url
{
    if([url hasPrefix:@"https:"])
    {
        return YES;
    }
    return NO;
}

//获取当前时间
- (NSString *)getNowDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 设置时间格式
    formatter.dateFormat = @"yyyyMMddHHmmss";
    NSString *str = [formatter stringFromDate:[NSDate date]];
    return str;
}

- (void)getSerializeWithNumber:(int)number withManager:(AFHTTPRequestOperationManager *)manager//
{
    switch (number) {
        case -1:
        {
            NSLog(@"默认操作");
            break;
        }
        case 0:
        {
            manager.requestSerializer = [AFJSONRequestSerializer serializer];
            break;
        }
        case 1:
        {
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        }
        case 2:
        {
            manager.requestSerializer = [AFJSONRequestSerializer serializer];
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        }
            break;
        default:
        {
            break;
        }
    }
}

@end
