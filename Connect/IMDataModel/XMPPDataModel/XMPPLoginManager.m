//
//  XMPPLoginManager.m
//  Connect
//
//  Created by Zhiyong Yang on 4/8/15.
//  Copyright (c) 2015 Andrew Yang. All rights reserved.
//

#import "XMPPLoginManager.h"
#import "XMPP.h"
#import "IMUserManager.h"
#import "IMMessage.h"
#import "XMPPIMUser.h"
#import "XMPPIMConnection.h"

@implementation XMPPLoginManager
{
    XMPPStream      *xmppStream;
    NSString        *strPassword;
    BOOL            bIsOpen;
    XMPPIMUser          *imUser;
    XMPPIMConnection    *connection;
}
- (IMUser*)LoginUser:(NSString *)userName password:(NSString *)password success:(void (^)())success failure:(void (^)(NSError *))failure{
    connection = [[XMPPIMConnection alloc]init];
    return [connection loginUser:userName password:password success:success failure:failure];
}


@end
