//
//  LoginManager.h
//  Connect
//
//  Created by Zhiyong Yang on 4/8/15.
//  Copyright (c) 2015 Andrew Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum : NSUInteger {
    IMUserStatusOffline,
    IMUserStatusConnecting,
    IMUserStatusConnectServerFailed,
    IMUserStatusConnectedToServer,
    IMUserStatusAuthenticating,
    IMUserStatusAuthenticationFailed,
    IMUserStatusLoggedIn,
    IMUserStatusAway
} IMUserStatus;

@interface LoginManager : NSObject
@property (strong, retain) NSString *server;
@property (strong, retain) NSString *port;
@property (nonatomic) IMUserStatus userStatus;

- (void)disconnect;
- (void)LoginUser:(NSString*)userName password:(NSString*)password success:(void (^)())success failure:(void(^)(NSError *error))failure;
@end
