//
//  DataManager.h
//  enrichall
//
//  Created by xiaoling on 15-4-22.
//  Copyright (c) 2015年 万高杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"

typedef void (^ImageReturn)(id responseObject);
typedef void (^block)(AFHTTPRequestOperation *operation, id responseObject);//成功
typedef void (^failureBlock)(id error);//失败

@interface DataManager : NSObject

@property (nonatomic,strong) NSMutableDictionary *taskDic;//记录任务的dic

+ (DataManager *)sharedManager;

- (void)requestWithUrl:(NSString *)url withkey:(NSString *)key withParameters:(id)parameter withImage:(UIImage *)image withRequestSerilize:(int)serialize withBlock:(ImageReturn)imageMessage;

- (void)requestWithUrl:(NSString *)url withkey:(NSString *)key withParameters:(id)parameter withImageArr:(NSArray *)imageArr withRequestSerilize:(int)serialize withBlock:(ImageReturn)imageMessage;

- (void)GetWithUrl:(NSString *)url withkey:(NSString *)key withRequestSerilize:(int)serialize withSuccessSBlock:(block)block withFailBlock:(failureBlock)failure;

- (void)PostWithUrl:(NSString *)url withkey:(NSString *)key withParameters:(id)parameter withRequestSerilize:(int)serialize withBlock:(block)block withFailBlock:(failureBlock)failureBlock;

@end
