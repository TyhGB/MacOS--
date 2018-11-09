//
//  EC_MainSplitViewController.m
//  eSpaceMac
//
//  Created by 联康 on 2018/11/2.
//  Copyright © 2018年 佰邦达. All rights reserved.
//

#import "EC_MainSplitViewController.h"

@interface EC_MainSplitViewController ()<NSSplitViewDelegate>
@property (weak) IBOutlet NSSplitView *mainSplitView;

@end

@implementation EC_MainSplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.

}


-(void)dealloc
{
    NSLog(@"mainSplitDealloc");
}
@end
