//
//  UIImage+HUDHelper.h
//  DYProgressHUD
//
//  Created by ff on 2019/7/15.
//  Copyright © 2019 大點哥. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^GIFimageBlock)(UIImage *GIFImage);
@interface UIImage (HUDHelper)

+(UIImage*)imageChangeColorToImage:(UIImage *)img color:(UIColor*)color;

// imagearr ->image
+ (UIImage *)imageWithGIFFrameArray:(NSArray *)arr duration:(NSTimeInterval)duration;

// local imagename ->image
+ (UIImage *)imageWithGIFNamed:(NSString *)name bundle:(nullable NSBundle *)bundle;

// image data ->image
+ (UIImage *)imageWithGIFData:(NSData *)data;

// image url ->image
+ (void)imageWithGIFUrl:(NSString *)url and:(GIFimageBlock)gifImageBlock;

// gif duration
+ (NSTimeInterval)durationForGifData:(NSData *)data;

@end

NS_ASSUME_NONNULL_END
