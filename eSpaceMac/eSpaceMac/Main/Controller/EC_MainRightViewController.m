//
//  EC_MainRightViewController.m
//  eSpaceMac
//
//  Created by 联康 on 2018/11/2.
//  Copyright © 2018年 佰邦达. All rights reserved.
//

#import "EC_MainRightViewController.h"

#import "EC_TextMessageMe.h"
#import "EC_TextMessageModel.h"

@interface EC_MainRightViewController ()<NSTableViewDelegate,NSTableViewDataSource,NSTextViewDelegate>
@property (weak) IBOutlet NSView *toolBackView;
@property (weak) IBOutlet NSTableView *chatRecordsTable;
@property (unsafe_unretained) IBOutlet NSTextView *InputTextView;

@property (nonatomic,strong) NSMutableArray *chatRecordsArr;

@end

@implementation EC_MainRightViewController
-(NSMutableArray *)chatRecordsArr
{
    if (!_chatRecordsArr) {
        _chatRecordsArr = [[NSMutableArray alloc] init];
    }
    return _chatRecordsArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    NSLog(@"EC_MainRightViewController load");
    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [NSColor blueColor].CGColor;
    //工具栏背景图
    self.toolBackView.wantsLayer = YES;
    self.toolBackView.layer.backgroundColor = [NSColor whiteColor].CGColor;
    
    //聊天记录
    self.chatRecordsTable.delegate = self;
    self.chatRecordsTable.dataSource = self;
    //输入框
//    self.InputTextView.delegate = self;
    
}

-(void)keyUp:(NSEvent *)event
{
    [super keyUp:event];
    //监听回车事件
    if ([event.characters isEqualToString:@"\r"]) {
        NSLog(@"回车事件");
        if (![self.InputTextView.string isEqualToString:@""]) {
            EC_TextMessageModel *model = [[EC_TextMessageModel alloc]init];
            model.text = self.InputTextView.string;
            EC_UserModel *userModel = [[EC_UserModel alloc] init];
            userModel.name = @"testName";
            userModel.imageName = @"5";
            model.userModel = userModel;
            [self.chatRecordsArr addObject:model];
            self.InputTextView.string = @"";
            [self.chatRecordsTable reloadData];
            [self.chatRecordsTable scrollRowToVisible:self.chatRecordsArr.count-1];
//            self.chatRecordsTable scrollto
        }else{
            
        }
    }
}




-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return self.chatRecordsArr.count;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    EC_TextMessageMe *cell = [tableView makeViewWithIdentifier:@"EC_TextMessageMe" owner:self];
    if (!cell) {
        [tableView registerNib:[[NSNib alloc] initWithNibNamed:@"EC_TextMessageMe" bundle:[NSBundle mainBundle] ] forIdentifier:@"EC_TextMessageMe"];
        cell = [tableView makeViewWithIdentifier:@"EC_TextMessageMe" owner:self];
    }
    EC_TextMessageModel *model = self.chatRecordsArr[row];
    cell.iconImage.image = [NSImage imageNamed:model.userModel.imageName];
    cell.sendText.stringValue = model.text;
    return cell;
}
-(CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row
{
    return 60;
}



-(void)dealloc
{
    NSLog(@"right dealloc");
}
@end
