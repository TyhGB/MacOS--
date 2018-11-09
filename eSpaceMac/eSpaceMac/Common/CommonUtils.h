//
//  CommonUtils.h
//  eSpaceMac
//
//  Created by 联康 on 2018/11/2.
//  Copyright © 2018年 佰邦达. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#define EC_APP_DELEGATE ((AppDelegate*)[NSApplication sharedApplication].delegate)


@interface CommonUtils : NSObject

+(instancetype)shareInstance;


/**
 弹出警告

 @param message 警告内容
 */
-(void)alertMessage:(NSString *)message;
@end
