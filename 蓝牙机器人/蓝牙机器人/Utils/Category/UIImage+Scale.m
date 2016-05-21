//
//  UIImage+Scale.m
//  RomanticAppiontment
//
//  Created by jacob on 15/6/11.
//  Copyright (c) 2015年 baichun. All rights reserved.
//

#import "UIImage+Scale.h"

@implementation UIImage(Scale)

+ (UIImage *)imageMax800WithImage:(UIImage *)img
{
    CGFloat h = img.size.height;
    CGFloat w = img.size.width;
    if(h <= 800 && w <= 800)
    {
        return img;
    }
    else
    {
        float b = (float)800.0/w < (float)800.0/h ? (float)800.0/w : (float)800.0/h;
        CGSize itemSize = CGSizeMake(b*w, b*h);
        UIGraphicsBeginImageContext(itemSize);
        CGRect imageRect = CGRectMake(0, 0, b*w, b*h);
        [img drawInRect:imageRect];
        img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return img;
    }
    return img;
}

/*
 图片自适应，已比例大的为准，等比例显示宽和高
 */
+ (UIImage *)imageShrinkSize:(CGSize)size withImage:(UIImage *)img
{
    CGFloat h = size.height;
    CGFloat w = size.width;
    
    CGFloat heightImg = img.size.height;
    CGFloat widthImg = img.size.width;
    if(heightImg > h && widthImg > w)
    {
        UIImage *imgNew = [[UIImage alloc] init];
        
        float b = (float)w/widthImg > (float)h/heightImg ? (float)w/widthImg : (float)h/heightImg;
        CGSize itemSize = CGSizeMake(b*widthImg, b*heightImg);
        UIGraphicsBeginImageContext(itemSize);
        CGRect imageRect = CGRectMake(0, 0, b*widthImg, b*heightImg);
        [img drawInRect:imageRect];
        imgNew = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return imgNew;

    }
    
    return img;
}
/**
 *  对图片尺寸进行压缩--
 */
-(UIImage*)imageScaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [self drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}

+ (UIImage *)imageScalingSize:(CGSize)size withImage:(UIImage *)img
{
    CGFloat h = size.height;
    CGFloat w = size.width;
    
    CGFloat heightImg = img.size.height;
    CGFloat widthImg = img.size.width;
//    if(heightImg > h && widthImg > w)
//    {
        UIImage *imgNew = [[UIImage alloc] init];
        
        float b = (float)w/widthImg > (float)h/heightImg ? (float)w/widthImg : (float)h/heightImg;
        CGSize itemSize = CGSizeMake(b*widthImg, b*heightImg);
        UIGraphicsBeginImageContext(itemSize);
        CGRect imageRect = CGRectMake(0, 0, b*widthImg, b*heightImg);
        [img drawInRect:imageRect];
        imgNew = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return imgNew;
        
//    }else
    return img;
}

+ (UIImage *)imageShrinkMinSize:(CGSize)size withImage:(UIImage *)img
{
    CGFloat h = size.height;
    CGFloat w = size.width;
    
    CGFloat heightImg = img.size.height;
    CGFloat widthImg = img.size.width;
    if(heightImg > h && widthImg > w)
    {
        UIImage *imgNew = [[UIImage alloc] init];
        
        float b = (float)w/widthImg < (float)h/heightImg ? (float)w/widthImg : (float)h/heightImg;
        CGSize itemSize = CGSizeMake(b*widthImg, b*heightImg);
        UIGraphicsBeginImageContext(itemSize);
        CGRect imageRect = CGRectMake(0, 0, b*widthImg, b*heightImg);
        [img drawInRect:imageRect];
        imgNew = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return imgNew;
        
    }
    
    return img;
}

@end
