//
//  DYProgressHUD.h
//  DYProgressHUD
//
//  Created by ff on 2019/7/12.
//  Copyright © 2019 大點哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYProgressHUDConfig.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^HUDTouchEventBlock)(void);

@interface DYProgressHUD : UIControl
#pragma mark - helper
// Configuration,optional,check->DYProgressHUDConfig.h
+(void)makeConfig:(nullable DYProgressHUDConfig *)config;

#pragma mark - api
// text only,auto dismiss;
+ (void)showMsg:(nullable NSString *)msg;

// msg with status,default success,auto dismiss;
+ (void)showStatus:(DYProgressHUDStatus)status msg:(nullable NSString *)msg;

// custom image, auto dismiss;
+ (void)showImage:(nullable UIImage *)image msg:(nullable NSString *)msg;

// custom image, need moto dismiss;
+ (void)showLivingImage:(nullable UIImage *)image msg:(nullable NSString *)msg;

// custom frame animation,need moto dismiss;
+ (void)showAnimationGIFSource:(nullable id)source msg:(nullable NSString *)msg;

// custom animation,animation play once,if you make duration <= 0,will aotu count ani's duration,auto dismiss ;
+ (void)shortAnimationGIFSource:(nullable id)source duration:(NSTimeInterval)duration msg:(nullable NSString *)msg;

// loading,status default arc,need moto dismiss;
+ (void)showloadingStatus:(DYProgressHUDStatus)status msg:(nullable NSString *)msg;

// progress,need moto dismiss;
+ (void)showProgress:(CGFloat)progress msg:(nullable NSString *)msg;

// just moto dismiss;
+ (void)dismiss;

+(void)touchEvent:(HUDTouchEventBlock)teb;

@end

NS_ASSUME_NONNULL_END
