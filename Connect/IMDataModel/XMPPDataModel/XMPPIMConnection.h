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

@interface XMPPIMConnection : IMConnection

#pragma mark - extended methods
- (void)onMessageReceived:(IMMessage*)IMMessage;
@end
