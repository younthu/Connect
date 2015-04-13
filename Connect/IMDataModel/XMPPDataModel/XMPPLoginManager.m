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
    imUser = [[XMPPIMUser alloc]init];
    
    imUser.userStatus = IMUserStatusConnecting;
    imUser.onLoginSucceed  = success;
    imUser.onLoginFailed   = failure;
    connection = [[XMPPIMConnection alloc]init];
    imUser.connection = connection;
    [self setupStream];
    
    //从本地取得用户名，密码和服务器地址
    
    NSString *userId =userName;
    NSString *pass = password;
    NSString *server = @"cache.qinmaohao.com";
    
    if (![xmppStream isDisconnected]) {
        if (success) {
            success();
        }
        
        return imUser;
    }
    
    if (userId == nil || pass == nil) {
        if (failure) {
            failure(nil);
        }
        imUser.userStatus = IMUserStatusAuthenticationFailed ;
        return imUser;
        
    }
    
    //设置用户
    [xmppStream setMyJID:[XMPPJID jidWithString:userId]];
    //设置服务器
    [xmppStream setHostName:server];
    //密码
    strPassword = pass;
    
    //连接服务器
    NSError *error = nil;
    if (![xmppStream connectWithTimeout:XMPPStreamTimeoutNone error:&error]) {
        NSLog(@"cant connect %@", server);
        imUser.userStatus = IMUserStatusConnectServerFailed;
        return imUser;
    }
    
    
    return imUser;
}

- (void)disconnect{
    
}

#pragma mark - private methods
-(void)setupStream
{
    xmppStream = [[XMPPStream alloc]init];
    [xmppStream addDelegate:self delegateQueue:dispatch_get_current_queue()];
    
}

//上线
-(void)goOnline
{
    XMPPPresence *presence = [XMPPPresence presence];
    [xmppStream sendElement:presence];
    connection = [[XMPPIMConnection alloc]init];
    imUser.connection = connection;
   
    if (imUser.onLoginSucceed) {
        imUser.onLoginSucceed();
    }
}

//下线
-(void)goOffline
{
    XMPPPresence *presence = [XMPPPresence presenceWithType:@"unavailable"];
    [xmppStream sendElement:presence];
    
}

#pragma mark - xmppStreamDelegate
//连接服务器
- (void)xmppStreamDidConnect:(XMPPStream *)sender{
    
    bIsOpen = YES;
    NSError *error = nil;
    //验证密码
    [xmppStream authenticateWithPassword:strPassword error:&error];
    
}

//验证通过
- (void)xmppStreamDidAuthenticate:(XMPPStream *)sender{
    imUser.userStatus = IMUserStatusLoggedIn;
    [self goOnline];
}

//收到消息
- (void)xmppStream:(XMPPStream *)sender didReceiveMessage:(XMPPMessage *)message{
    
    NSLog(@"message = %@", message);
    
    NSString *idStr = [[message attributeForName:@"id"] stringValue];
    NSString *msg = [[message elementForName:@"body"] stringValue];
    NSString *from = [[message attributeForName:@"from"] stringValue];
    NSString *to = [[message attributeForName:@"to"] stringValue];
//    NSString *strTime = [Statics getCurrentTime];
    IMMessage *_message = [[IMMessage alloc]init];
    if (msg && from) {
        XMPPIMConnection *_connection =  connection;
        [_connection onMessageReceived:_message];
    }
    
}

//收到好友状态
- (void)xmppStream:(XMPPStream *)sender didReceivePresence:(XMPPPresence *)presence{
    
    NSLog(@"presence = %@", presence);
    
    //取得好友状态
    NSString *presenceType = [presence type]; //online/offline
    //当前用户
    NSString *userId = [[sender myJID] user];
    //在线用户
    NSString *presenceFromUser = [[presence from] user];
    
    if (![presenceFromUser isEqualToString:userId]) {
        
        //在线状态
        if ([presenceType isEqualToString:@"available"]) {
            
            //用户列表委托(后面讲)
            //            [self.userListDelegate newBuddyOnline:[NSString stringWithFormat:@"%@@%@", presenceFromUser, STRLOCAL]];
//            self.blockNewBuddyOnline([NSString stringWithFormat:@"%@@%@", presenceFromUser, STRLOCAL]);
            
        }else if ([presenceType isEqualToString:@"unavailable"]) {
            //用户列表委托(后面讲)
            //            [self.userListDelegate buddyWentOffline:[NSString stringWithFormat:@"%@@%@", presenceFromUser, STRLOCAL]];
//            self.blockBuddyWentOffline([NSString stringWithFormat:@"%@@%@", presenceFromUser, STRLOCAL]);
        }
        
    }
    
}
@end
