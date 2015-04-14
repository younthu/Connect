//
//  XMPPIMConnect.h
//  Connect
//
//  Created by Zhiyong Yang on 4/13/15.
//  Copyright (c) 2015 Andrew Yang. All rights reserved.
//

#import "IMConnection.h"
#import "BlockTypes.h"

@class IMMessage;
@class IMUser;

@interface XMPPIMConnection :IMConnection

#pragma mark - extended methods

// TODO: remove this method
- (IMUser*)loginUser:(NSString*)userId password:(NSString*)password success:(void (^)())success failure:(void (^)())failure;

@end
