//
//  EC_LoginViewController.m
//  eSpaceMac
//
//  Created by 联康 on 2018/11/2.
//  Copyright © 2018年 佰邦达. All rights reserved.
//

#import "EC_LoginViewController.h"

@interface EC_LoginViewController ()<NSTextFieldDelegate>
@property (weak) IBOutlet NSImageView *headImgae;
@property (weak) IBOutlet NSTextField *account;
@property (weak) IBOutlet NSSecureTextField *password;

@end

@implementation EC_LoginViewController

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.password.delegate = self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}



-(void)keyUp:(NSEvent *)event
{
    [super keyUp:event];
    //监听回车事件
    if ([event.characters isEqualToString:@"\r"]) {
        NSLog(@"回车事件");
        if (![self.account.stringValue isEqualToString:@""]&&![self.password.stringValue isEqualToString:@""]) {
            NSLog(@"有账号密码 可以开始进行 账号验证");
            [EC_APP_DELEGATE showMainWindow];
        }else{
            [[CommonUtils shareInstance] alertMessage:@"账号或者密码不能为空"];
        }
    }
}



- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    
    // Update the view, if already loaded.
}

@end
