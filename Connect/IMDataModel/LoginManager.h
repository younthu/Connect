//
//  LoginManager.h
//  Connect
//
//  Created by Zhiyong Yang on 4/8/15.
//  Copyright (c) 2015 Andrew Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginManager : NSObject
@property (strong, retain) NSString *server;
@property (strong, retain) NSString *port;
- (void)disconnect;
- (void)LoginUser:(NSString*)userName password:(NSString*)password success:(void (^)())success failure:(void(^)(NSError *error))failure;
@end
