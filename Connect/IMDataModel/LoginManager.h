//
//  LoginManager.h
//  Connect
//
//  Created by Zhiyong Yang on 4/8/15.
//  Copyright (c) 2015 Andrew Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMUser.h"



@interface LoginManager : NSObject
@property (strong, retain) NSString *server;
@property (strong, retain) NSString *port;

- (void)disconnect;
/**
 *  Login user
 *  
 *  Login logic should be a completed logic. After login, all messages will be sent/received via IMConnection.
 *  Every User has its own connection.
 *
 *  @param userName <#userName description#>
 *  @param password <#password description#>
 *  @param success  <#success description#>
 *  @param failure  <#failure description#>
 *
 *  @return <#return value description#>
 */
- (IMUser*)LoginUser:(NSString*)userName password:(NSString*)password success:(void (^)())success failure:(void(^)(NSError *error))failure;
@end
