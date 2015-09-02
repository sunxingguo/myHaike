//
//  CompressionPhoto.m
//  enrichall
//
//  Created by xiaoling on 15-4-22.
//  Copyright (c) 2015年 万高杰. All rights reserved.
//

#import "CompressionPhoto.h"
#define MAXBORDERWIDTH 1200.0

@implementation CompressionPhoto

+ (NSData *)CompressionPhotoWithImage:(UIImage *)originialImage
{
    float compressRate = 0.6;
    if((UIImageJPEGRepresentation(originialImage, 1).length / 1024.0) < 150)//小于150K就直接上传
    {
        return UIImageJPEGRepresentation(originialImage, 1);
    }
    NSLog(@"%ld", (unsigned long)UIImageJPEGRepresentation(originialImage, 1).length);
    __block NSData *imageData;
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
        imageData = UIImageJPEGRepresentation(originialImage, compressRate);
        
        while ((imageData.length / 1024.0) > 150) {
            UIImage *image = [UIImage imageWithData:imageData];
            imageData = UIImageJPEGRepresentation(image, compressRate);
        }
    });
    return imageData;
}

+ (UIImage *)changeImageWithImage:(UIImage *)image withFinialSize:(CGSize)finialSize//自定义尺寸
{
    UIGraphicsBeginImageContext(finialSize);
    [image drawInRect:CGRectMake(0, 0, finialSize.width, finialSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)changeImageSizeWithImage:(UIImage *)image
{
    float maxBorder = MAX(image.size.width, image.size.height);
    CGSize newSize;
    if(maxBorder > MAXBORDERWIDTH)//最大的边大于1600
    {
        if(maxBorder == image.size.width)
        {
            newSize = CGSizeMake(MAXBORDERWIDTH, image.size.height * (MAXBORDERWIDTH / image.size.width));
        }
        else
        {
            newSize = CGSizeMake(image.size.width * (MAXBORDERWIDTH / image.size.height), MAXBORDERWIDTH);
        }
    }
    else
    {
        newSize=image.size;
    }
    UIImage *newImage = [self changeImageWithImage:image withFinialSize:newSize];
    return newImage;
}

+ (NSData *)getFinialDataWithImage:(UIImage *)image
{
    UIImage *newImage;
    NSData *newData;
    newImage = [self changeImageSizeWithImage:image];
    newData = [self CompressionPhotoWithImage:newImage];
    return newData;
}

@end
