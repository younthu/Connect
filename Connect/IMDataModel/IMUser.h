//
//  IMUser.h
//  Connect
//
//  Created by Zhiyong Yang on 4/9/15.
//  Copyright (c) 2015 Andrew Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMConnection.h"

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

@interface IMUser : NSObject
@property (nonatomic) IMUserStatus UserStatus;
@property (nonatomic) IMConnection *connection;// Please assign connection to user after login or reconnected in login manager. It will be used for sending message
@property (nonatomic) NSString *userName;
@property (nonatomic) NSString *userId;
@end
