//
//  CommonUtils.m
//  eSpaceMac
//
//  Created by 联康 on 2018/11/2.
//  Copyright © 2018年 佰邦达. All rights reserved.
//

#import "CommonUtils.h"
#import <AppKit/AppKit.h>

@implementation CommonUtils

+(instancetype)shareInstance
{
    static CommonUtils *_commonUtils = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _commonUtils = [[CommonUtils alloc] init];
    });
    return _commonUtils;
    
}

-(void)alertMessage:(NSString *)message
{
    NSAlert *alert = [[NSAlert alloc] init];
    [alert setMessageText:@"tip"];
    [alert setInformativeText:message];
    [alert addButtonWithTitle:@"ok"];
    [alert setAlertStyle:NSAlertStyleWarning];
    [alert runModal];
}

@end
