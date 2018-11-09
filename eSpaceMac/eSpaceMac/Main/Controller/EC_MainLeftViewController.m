//
//  EC_MainLeftViewController.m
//  eSpaceMac
//
//  Created by 联康 on 2018/11/2.
//  Copyright © 2018年 佰邦达. All rights reserved.
//

#import "EC_MainLeftViewController.h"
#import "EC_UserModel.h"
#import "EC_MainRightViewController.h"
#import "EC_MainSplitViewController.h"


@interface EC_MainLeftViewController ()<NSTableViewDelegate,NSTableViewDataSource>

@property (weak) IBOutlet NSTableView *tableView;

//会话集合
@property (nonatomic,strong) NSArray *sessionArr;
@end

@implementation EC_MainLeftViewController

-(NSArray *)sessionArr
{
    if (!_sessionArr) {
        _sessionArr = [[NSArray alloc] init];
        EC_UserModel *userModel1 = [[EC_UserModel alloc] init];
        userModel1.name = @"张三";
        userModel1.subText = @"1";
        userModel1.imageName = @"2";
        EC_UserModel *userModel2 = [[EC_UserModel alloc] init];
        userModel2.name = @"李四";
        userModel2.subText = @"2";
        userModel2.imageName = @"3";
        EC_UserModel *userModel3 = [[EC_UserModel alloc] init];
        userModel3.name = @"王五";
        userModel3.subText = @"3";
        userModel3.imageName = @"4";
        
        _sessionArr = @[userModel1,userModel2,userModel3];

    }
    return _sessionArr;
}
-(void)awakeFromNib
{
    [super awakeFromNib];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.


}

-(void)dealloc
{
    NSLog(@"left dealloc");
}




#pragma mark - NSTableViewDelegate and DataSource


-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return self.sessionArr.count;
}



-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    //获取表格列的标识符
    NSString *columnID = tableColumn.identifier;
    NSLog(@"columnID : %@ ,row : %d",columnID,row);
    
    NSTableCellView *cell = [tableView makeViewWithIdentifier:@"ImageCellID" owner:self];
    if (!cell) {
        cell = [[NSTableCellView alloc] init];
        cell.identifier = @"ImageCellID";
    }
    EC_UserModel *userModel = self.sessionArr[row];
    cell.textField.stringValue = userModel.name;
    cell.imageView.image = [NSImage imageNamed:userModel.imageName];
    return cell;
}


-(CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row
{
    return 50.0;
}

-(void)tableViewSelectionDidChange:(NSNotification *)notification
{
    NSTableView *tableView = notification.object;
    NSLog(@"did select row:%ld,col:%ld",tableView.selectedRow,tableView.selectedColumn);
    NSTableCellView *cell = [tableView viewAtColumn:tableView.selectedColumn row:tableView.selectedRow makeIfNecessary:NO];
    NSMutableDictionary *chatVCDic = EC_APP_DELEGATE.chatVCDic;
    EC_MainRightViewController *rightVC;
    NSStoryboard *storyboard = [NSStoryboard storyboardWithName:@"EC_MainSplitViewController" bundle:nil];
    if ([chatVCDic.allKeys containsObject:cell.textField.stringValue]) {
        rightVC = [chatVCDic valueForKey:cell.textField.stringValue];
    }else{
        rightVC = [storyboard instantiateControllerWithIdentifier:@"rightVC"];
        [chatVCDic setValue:rightVC forKey:cell.textField.stringValue];
    }
    
    EC_MainSplitViewController *mainVC = EC_APP_DELEGATE.mainSplitVC;

    
    [mainVC removeSplitViewItem:mainVC.splitViewItems.lastObject];
    [mainVC addSplitViewItem:[NSSplitViewItem splitViewItemWithViewController:rightVC]];


    
}

@end
