//
//  AppDelegate.h
//  eSpaceMac
//
//  Created by 联康 on 2018/11/1.
//  Copyright © 2018年 佰邦达. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "EC_MainSplitViewController.h"
#import "EC_MainLeftViewController.h"
#import "EC_MainRightViewController.h"
#import "EC_MainWindowController.h"
#import "EC_ContactViewController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic,strong) EC_MainWindowController *mainWindow;
@property (nonatomic,strong) EC_MainSplitViewController *mainSplitVC;
@property (nonatomic,strong) EC_MainLeftViewController *leftVC;
@property (nonatomic,strong) EC_MainRightViewController *rightVC;
@property (nonatomic,strong) EC_ContactViewController *contactVC;

@property (nonatomic,strong) NSMutableDictionary *chatVCDic;
- (void)showMainWindow;
@end

