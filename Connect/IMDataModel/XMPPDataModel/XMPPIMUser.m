//
//  XMPPIMUser.m
//  Connect
//
//  Created by Zhiyong Yang on 4/13/15.
//  Copyright (c) 2015 Andrew Yang. All rights reserved.
//

#import "XMPPIMUser.h"

@implementation XMPPIMUser
- (void)sendMessage:(IMMessage *)message success:(void (^)())success failure:(void (^)())failure{
   [self.connection sendMessage:message success:^{
       
   } failure:^{
       
   }];
}
@end
