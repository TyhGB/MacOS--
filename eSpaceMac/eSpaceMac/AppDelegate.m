//
//  AppDelegate.m
//  eSpaceMac
//
//  Created by 联康 on 2018/11/1.
//  Copyright © 2018年 佰邦达. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
-(NSMutableDictionary *)chatVCDic
{
    if (!_chatVCDic) {
        _chatVCDic = [[NSMutableDictionary alloc]init];
    }
    return _chatVCDic;
}
- (void)showMainWindow
{
    NSStoryboard *storyboard = [NSStoryboard storyboardWithName:@"EC_MainSplitViewController" bundle:nil];
    self.mainWindow = [storyboard instantiateInitialController];
    //初始化属性
    NSSplitViewController *splitVC =(NSSplitViewController *)self.mainWindow.contentViewController;
    self.mainSplitVC = (EC_MainSplitViewController *)[splitVC.splitViewItems.lastObject viewController];
    self.leftVC = (EC_MainLeftViewController*)self.mainSplitVC.splitViewItems.firstObject.viewController;
    self.rightVC = (EC_MainRightViewController*)self.mainSplitVC.splitViewItems.lastObject.viewController;
    [self.mainWindow showWindow:self.mainWindow.window];
    
    //初始化联系人界面
    NSStoryboard *contactStoryboard = [NSStoryboard storyboardWithName:@"EC_ContactStoryboard" bundle:nil];
    self.contactVC = [contactStoryboard instantiateControllerWithIdentifier:@"contactVC"];
    
    
    
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    }


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
