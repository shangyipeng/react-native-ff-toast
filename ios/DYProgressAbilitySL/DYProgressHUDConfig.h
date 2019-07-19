//
//  DYProgressHUDConfig.h
//  DYProgressHUD
//
//  Created by ff on 2019/7/13.
//  Copyright © 2019 大點哥. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

//typedef NS_ENUM(NSInteger, DYProgressHUDWaitStatus) {
//    DYProgressHUDWaitStatus_Arc = 0,
//    DYProgressHUDWaitStatus_Balls,
//    DYProgressHUDWaitStatus_system
//};

typedef NS_ENUM(NSInteger, DYProgressHUDStatus) {
    DYProgressHUDStatus_Success = 0,
    DYProgressHUDStatus_Fail,
    DYProgressHUDStatus_Tips,
    DYProgressHUDStatus_Question,
    DYProgressHUDStatus_Custom,
    DYProgressHUDStatus_CustomAnimation,
    DYProgressHUDStatus_WaitArc,
    DYProgressHUDStatus_WaitBalls,
    DYProgressHUDStatus_WaitSystem,
    DYProgressHUDStatus_Progress,
};

typedef NS_ENUM(NSInteger, DYProgressHUDPicturePosition) {
    DYProgressHUDPicturePosition_marginUp = 0,
    DYProgressHUDPicturePosition_marginDown,
    DYProgressHUDPicturePosition_marginLeft,
    DYProgressHUDPicturePosition_marginRight,
};

@interface DYProgressHUDConfig : NSObject

// assian superContainer,default window
@property (nonatomic, strong, nullable)UIView *superResp;
// auto dismiss duration,default 1.0s
@property (nonatomic, assign)CGFloat shortTimeInterval;
// screen backgroundcolor,default clear
@property (nonatomic, strong, nullable)UIColor *backBoardColor;

// screen touch for event,default is NO
@property (nonatomic, assign)BOOL touchEnable;
// touchAction,if only touchEnable is YES
@property(nonatomic,copy)void(^touchHUDBlock)(id obj);

// text font,default 14pt
@property (nonatomic, strong)UIFont *textFont;
// text',progress',loading' color,default white
@property (nonatomic, strong, nullable)UIColor *contentColor;
// content board color,default clear
@property (nonatomic, strong, nullable)UIColor *boardColor;
// board.cornerRadius,default 7
@property (nonatomic, strong, nullable)NSString *boardRadius;
// image size custom
@property (nonatomic, assign)CGFloat customImageScale;


// another method init
- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
