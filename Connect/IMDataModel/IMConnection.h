//
//  IMConnection.h
//  Connect
//
//  Created by Zhiyong Yang on 4/9/15.
//  Copyright (c) 2015 Andrew Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class IMMessage;

@interface IMConnection : NSObject
@property (nonatomic, strong) IMMessage *latestMessage;
- (void)sendMessage:(IMMessage*)message success:(void(^)())success failure:(void (^)())failure;
@end
