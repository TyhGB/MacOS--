//
//  EC_TopViewController.m
//  eSpaceMac
//
//  Created by 联康 on 2018/11/7.
//  Copyright © 2018年 佰邦达. All rights reserved.
//

#import "EC_TopViewController.h"


#import "EC_ContactViewController.h"
#import "EC_MainSplitViewController.h"
#import "EC_MainLeftViewController.h"
@interface EC_TopViewController ()
@property (weak) IBOutlet NSButton *ChatBtn;
@property (weak) IBOutlet NSButton *ContactBtn;

@end

@implementation EC_TopViewController
-(void)awakeFromNib
{
    [super awakeFromNib];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
}

- (IBAction)chatClick:(NSButton *)sender {
    if(![self.ChatBtn.image.name isEqualToString:@"EC_Chat_selected"])
    {
        [self.ChatBtn setImage:[NSImage imageNamed:@"EC_Chat_selected"]];
    }
    if (![self.ContactBtn.image.name isEqualToString:@"EC_Contact"]) {
        [self.ContactBtn setImage:[NSImage imageNamed:@"EC_Contact"]];
    }
    EC_MainLeftViewController *leftVC = EC_APP_DELEGATE.leftVC;
    EC_MainSplitViewController *mainSplit = EC_APP_DELEGATE.mainSplitVC;
    
    [mainSplit removeSplitViewItem:mainSplit.splitViewItems.firstObject];
    [mainSplit insertSplitViewItem:[NSSplitViewItem splitViewItemWithViewController:leftVC] atIndex:0];

}

- (IBAction)contactClick:(NSButton *)sender {
    if(![self.ChatBtn.image.name isEqualToString:@"EC_Chat"])
    {
        [self.ChatBtn setImage:[NSImage imageNamed:@"EC_Chat"]];
    }
    if (![self.ContactBtn.image.name isEqualToString:@"EC_Contact_selected"]) {
        [self.ContactBtn setImage:[NSImage imageNamed:@"EC_Contact_selected"]];
    }
    EC_ContactViewController *contact = EC_APP_DELEGATE.contactVC;
    EC_MainSplitViewController *mainSplit = EC_APP_DELEGATE.mainSplitVC;
    
    [mainSplit removeSplitViewItem:mainSplit.splitViewItems.firstObject];
    [mainSplit insertSplitViewItem:[NSSplitViewItem splitViewItemWithViewController:contact] atIndex:0];
    
}

@end
