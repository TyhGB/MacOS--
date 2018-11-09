//
//  RootModel.h
//  eSpaceMac
//
//  Created by 联康 on 2018/11/7.
//  Copyright © 2018年 佰邦达. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LeafModel : NSObject

@property (nonatomic,strong) NSString *leafName;
@property (nonatomic,assign) BOOL hasChildren;

-(instancetype)init:(NSString *)name;


@end

@interface RootModel : NSObject
@property (nonatomic,strong) NSString *name;
@property (nonatomic,assign) BOOL isLeaf;
@property (nonatomic,strong) NSArray<LeafModel *> *children;
@end
