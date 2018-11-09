//
//  EC_TextMessageModel.h
//  eSpaceMac
//
//  Created by 联康 on 2018/11/9.
//  Copyright © 2018年 佰邦达. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EC_UserModel.h"

@interface EC_TextMessageModel : NSObject
@property (nonatomic,copy) NSString *text;
@property (nonatomic,strong) EC_UserModel *userModel;
@end
