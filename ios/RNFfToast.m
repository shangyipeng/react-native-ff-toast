
#import "RNFfToast.h"
#import "DYProgressAbilitySL/DYProgressHUD.h"
#import "DYProgressAbilitySL/DYProgressHUDConfig.h"
#import "DYProgressAbilitySL/UIImage+HUDHelper.h"
@implementation RNFfToast

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE(RNFFHUD)

- (UIColor *)getColorByArr:(NSArray *)arr {
    CGFloat r = [arr[0] floatValue]/255.0;
    CGFloat g = [arr[1] floatValue]/255.0;
    CGFloat b = [arr[0] floatValue]/255.0;
    CGFloat a = [arr[0] floatValue]/255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}

- (void)getConfigByDic:(nullable NSDictionary *)dic {
    NSMutableDictionary *dics = [NSMutableDictionary dictionaryWithDictionary:dic];
    if (![dic isKindOfClass:[NSNull class]] || dic.allKeys.count != 0) {
        if ([dic objectForKey:@"backBoardColor"]) {
            NSArray *colorArr = (NSArray *)[dic objectForKey:@"backBoardColor"];
            [dics setValue:[self getColorByArr:colorArr] forKey:@"backBoardColor"];
        }
        if ([dic objectForKey:@"contentColor"]) {
            NSArray *colorArr = (NSArray *)[dic objectForKey:@"contentColor"];
            [dics setValue:[self getColorByArr:colorArr] forKey:@"contentColor"];
        }
        if ([dic objectForKey:@"boardColor"]) {
            NSArray *colorArr = (NSArray *)[dic objectForKey:@"boardColor"];
            [dics setValue:[self getColorByArr:colorArr] forKey:@"boardColor"];
        }
        if ([dic objectForKey:@"textFont"]) {
            CGFloat font = [[dic objectForKey:@"textFont"] floatValue];
            [dics setValue:[UIFont systemFontOfSize:font] forKey:@"textFont"];
        }
        [DYProgressHUD makeConfig:[[DYProgressHUDConfig alloc]initWithDictionary:dics]];
    }
}

#pragma mark -  纯文字toast
RCT_EXPORT_METHOD(HUDMsg:(nullable NSString *)msg config:(nullable NSDictionary *)config callback:(RCTResponseSenderBlock)callback) {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self getConfigByDic:config];
        [DYProgressHUD showMsg:msg];
        [DYProgressHUD touchEvent:^{
            callback(@[]);
        }];
    });
}


#pragma mark -  自带提示toast

RCT_EXPORT_METHOD(HUDTips:(int)tips Msg:(nullable NSString *)msg config:(nullable NSDictionary *)config callback:(RCTResponseSenderBlock)callback){
    dispatch_async(dispatch_get_main_queue(), ^{
        [self getConfigByDic:config];
        [DYProgressHUD showStatus:tips msg:msg];
        [DYProgressHUD touchEvent:^{
            callback(@[]);
        }];
    });
}

#pragma mark -  自定义图片toast
RCT_EXPORT_METHOD(HUDCustomImage:(nullable NSString *)imageStr isLiving:(BOOL)isLiving Msg:(nullable NSString *)msg config:(nullable NSDictionary *)config callback:(RCTResponseSenderBlock)callback){
    dispatch_async(dispatch_get_main_queue(), ^{
        [self getConfigByDic:config];
        UIImage *image;
        NSString *souceString = imageStr.lowercaseString;
        if (([souceString hasPrefix:@"http"] && [souceString hasSuffix:@".gif"]) || [souceString hasPrefix:@"data:image/gif;base64,"]) {
            image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageStr]]];
        }else if ([souceString hasPrefix:@"file"] && [souceString hasSuffix:@".gif"]) {
            image = [UIImage imageWithData:[NSData dataWithContentsOfFile:imageStr]];
        }
        if (isLiving == YES) {
            [DYProgressHUD showLivingImage:image msg:msg];
        }else {
            [DYProgressHUD showImage:image msg:msg];
        }
        [DYProgressHUD touchEvent:^{
            callback(@[]);
        }];
    });
}

#pragma mark -  自定义GIFtoast
RCT_EXPORT_METHOD(HUDCustomGif:(nullable NSString *)gif isLiving:(BOOL)isLiving Msg:(nullable NSString *)msg config:(nullable NSDictionary *)config customDuration:(CGFloat)customDuration callback:(RCTResponseSenderBlock)callback){
    dispatch_async(dispatch_get_main_queue(), ^{
        [self getConfigByDic:config];
        if (isLiving == YES) {
            [DYProgressHUD showAnimationGIFSource:gif msg:msg];
        }else {
            [DYProgressHUD shortAnimationGIFSource:gif duration:customDuration msg:msg];
        }
        
        [DYProgressHUD touchEvent:^{
            callback(@[]);
        }];
        
    });
}

#pragma mark - 等待toast
RCT_EXPORT_METHOD(HUDLoading:(int)loadingTips Msg:(nullable NSString *)msg config:(nullable NSDictionary *)config callback:(RCTResponseSenderBlock)callback){
    dispatch_async(dispatch_get_main_queue(), ^{
        [self getConfigByDic:config];
        [DYProgressHUD showloadingStatus:loadingTips msg:msg];
        [DYProgressHUD touchEvent:^{
            callback(@[]);
        }];
    });
}

#pragma mark - 进度条toast
RCT_EXPORT_METHOD(HUDProgress:(CGFloat)progress Msg:(nullable NSString *)msg config:(nullable NSDictionary *)config callback:(RCTResponseSenderBlock)callback){
    dispatch_async(dispatch_get_main_queue(), ^{
        [self getConfigByDic:config];
        [DYProgressHUD showProgress:progress msg:msg];
        [DYProgressHUD touchEvent:^{
            callback(@[]);
        }];
    });
}

#pragma mark - 进度条toast
RCT_EXPORT_METHOD(HUDDismiss){
    dispatch_async(dispatch_get_main_queue(), ^{
        [DYProgressHUD dismiss];
    });
}


@end
  
