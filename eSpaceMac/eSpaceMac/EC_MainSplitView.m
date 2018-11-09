//
//  EC_MainSplitView.m
//  eSpaceMac
//
//  Created by 联康 on 2018/11/8.
//  Copyright © 2018年 佰邦达. All rights reserved.
//

#import "EC_MainSplitView.h"


@interface EC_MainSplitView ()<NSSplitViewDelegate>


@end
@implementation EC_MainSplitView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    // Drawing code here.
}
-(void)awakeFromNib
{
    [super awakeFromNib];
}



//缩放窗口时保持首列面板大小
-(void)resizeSubviewsWithOldSize:(NSSize)oldSize
{
    CGFloat oldWidth = self.arrangedSubviews.firstObject.frame.size.width;
    [self adjustSubviews];
    [self setPosition:oldWidth ofDividerAtIndex:0];
    
}

@end
