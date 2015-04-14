//
//  DemoMessagesViewController+XMPPDemo.m
//  Connect
//
//  Created by Zhiyong Yang on 4/14/15.
//  Copyright (c) 2015 Andrew Yang. All rights reserved.
//

#import "DemoMessagesViewController+XMPPDemo.h"

@implementation DemoMessagesViewController (XMPPDemo)
- (IMUser*)loginUser:(NSString *)userName password:(NSString *)password{
    self.loginManager = [[XMPPLoginManager alloc]init];
    self.loginManager.server = @"cache.qinmaohao.com";
    //    self.loginManager.port =o
    return [self.loginManager LoginUser:@"test2@cache.qinmaohao.com" password:@"111111" success:^{
        NSLog(@"Login success!");
    } failure:^(NSError *error) {
        NSLog(@"*** Login failed:%@", error);
    }];
}
@end
