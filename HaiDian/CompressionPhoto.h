//
//  CompressionPhoto.h
//  enrichall
//
//  Created by xiaoling on 15-4-22.
//  Copyright (c) 2015年 万高杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CompressionPhoto : NSObject//用来出来图片

+ (NSData *)CompressionPhotoWithImage:(UIImage *)originialImage;//压缩图片

+ (UIImage *)changeImageWithImage:(UIImage *)image withFinialSize:(CGSize)finialSize;//修改图片尺寸

+ (UIImage *)changeImageSizeWithImage:(UIImage *)image;

+ (NSData *)getFinialDataWithImage:(UIImage *)image;//一键进行打包成服务器要求的data

@end
