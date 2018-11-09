//
//  EC_ContactViewController.m
//  eSpaceMac
//
//  Created by 联康 on 2018/11/7.
//  Copyright © 2018年 佰邦达. All rights reserved.
//

#import "EC_ContactViewController.h"
#import "RootModel.h"

@interface EC_ContactViewController ()<NSOutlineViewDelegate,NSOutlineViewDataSource>
@property (weak) IBOutlet NSOutlineView *contactOutlineView;

@property (nonatomic,strong) NSArray *rootArr;
@end

@implementation EC_ContactViewController

-(NSArray *)rootArr
{
    if (!_rootArr) {
        _rootArr = [[NSArray alloc]init];

    }
    return _rootArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    [self setupDataModel];
    self.contactOutlineView.dataSource = self;
    self.contactOutlineView.delegate = self;
    [self.contactOutlineView expandItem:nil expandChildren:YES];
}


- (void)setupDataModel
{
    LeafModel *leaf1 = [[LeafModel alloc] init:@"Objective-C"];
    LeafModel *leaf2 = [[LeafModel alloc] init:@"Swift"];
    LeafModel *leaf3 = [[LeafModel alloc] init:@"Java"];
    LeafModel *leaf4 = [[LeafModel alloc] init:@"Phython"];

    RootModel *root1 =[[RootModel alloc] init];
    root1.name = @"Language";
    root1.children = @[leaf1,leaf2,leaf3,leaf4];
    
    
    LeafModel *leaf5 = [[LeafModel alloc] init:@"Beijing"];
    LeafModel *leaf6 = [[LeafModel alloc] init:@"Guangzhou"];
    LeafModel *leaf7 = [[LeafModel alloc] init:@"Shanghai"];
    LeafModel *leaf8 = [[LeafModel alloc] init:@"Shenzhen"];
    RootModel *root2 =[[RootModel alloc] init];
    root2.name = @"City";
    root2.children = @[leaf5,leaf6,leaf7,leaf8];
    self.rootArr = @[root1,root2];
}

//个数
-(NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item
{
    if ([item isKindOfClass:[RootModel class]]) {
        RootModel *root = (RootModel *)item;
        return root.children.count;
    }
    return self.rootArr.count;
}
//是否可以展开
-(BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item
{
    return [item isKindOfClass:[RootModel class]];
}

//展示层级数据
-(id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item
{
    if ([item isKindOfClass:[RootModel class]]) {
        RootModel *root = (RootModel *)item;
        return root.children[index];
    }
    return self.rootArr[index];
}

-(NSView *)outlineView:(NSOutlineView *)outlineView viewForTableColumn:(NSTableColumn *)tableColumn item:(id)item
{
    NSTableCellView *cell;
    if ([item isKindOfClass:[RootModel class]]) {
        cell = [outlineView makeViewWithIdentifier:@"HeaderCell" owner:self];
        if (!cell) {
            cell = [[NSTableCellView alloc] init];
        }
        RootModel *root = (RootModel*)item;
        cell.textField.stringValue = root.name;
    }else{
        cell = [outlineView makeViewWithIdentifier:@"DataCell" owner:self];
        if (!cell) {
            cell = [[NSTableCellView alloc] init];
        }
        LeafModel *leaf = (LeafModel*)item;
        cell.textField.stringValue = leaf.leafName;
    }
    return cell;
}
@end
