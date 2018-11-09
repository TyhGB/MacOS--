//
//  EC_MainWindowController.m
//  eSpaceMac
//
//  Created by 联康 on 2018/11/5.
//  Copyright © 2018年 佰邦达. All rights reserved.
//

#import "EC_MainWindowController.h"

#import "EC_TabTilteView.h"

@interface EC_MainWindowController ()<NSWindowDelegate>

//@property (nonatomic,strong) EC_TabTilteView *tabView;//自定义TitleBar

@end

@implementation EC_MainWindowController

-(void)awakeFromNib
{
    [super awakeFromNib];

}
- (void)windowDidLoad {
    [super windowDidLoad];
    
    self.window.title = @"聊天";
    // 隐藏标题
    self.window.titlebarAppearsTransparent = YES;
    self.window.titleVisibility = NSWindowTitleHidden;
    //设置类型
    self.window.styleMask = NSWindowStyleMaskFullSizeContentView|NSWindowStyleMaskTitled|NSWindowStyleMaskResizable|NSWindowStyleMaskMiniaturizable|NSWindowStyleMaskClosable;
    //设置代理
    self.window.delegate = self;
    //设置点击背景可以拖动窗口
    [self.window setMovableByWindowBackground:YES];

}

// 根据是否全屏刷新布局
- (void)windowResizeAction:(BOOL)fullscreen{
    
    // 获取titlebar视图
    NSView *titleBarContainerView = [self.window standardWindowButton:NSWindowCloseButton].superview.superview;
    [titleBarContainerView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.right.equalTo(@0);
        make.top.equalTo(@0);
        if (fullscreen) {
            make.height.equalTo(@22);
        } else {
            make.height.mas_equalTo(40);
        }
    }];
    
    // 关闭、最小化等按钮
    NSButton *closeBtn = [self.window standardWindowButton:NSWindowCloseButton];
    NSButton *zoomBtn = [self.window standardWindowButton:NSWindowZoomButton];
    NSButton *minBtn = [self.window standardWindowButton:NSWindowMiniaturizeButton];
    
    
    for (NSView *buttonView in @[closeBtn, zoomBtn, minBtn]) {
        [buttonView mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (fullscreen) {
                make.top.mas_equalTo(3.0);
            } else {
                make.centerY.mas_equalTo(buttonView.superview.mas_centerY);
            }
        }];
    }
}

#pragma mark - WindowDelegate Methods
- (void)windowDidEnterFullScreen:(NSNotification *)notification {
//    [self windowResizeAction:true];
}
- (void)windowDidExitFullScreen:(NSNotification *)notification {
//    [self windowResizeAction:false];
}
- (void)windowDidResize:(NSNotification *)notification {
//    [self windowResizeAction:false];
}

@end
