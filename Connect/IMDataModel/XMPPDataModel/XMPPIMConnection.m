//
//  XMPPIMConnect.m
//  Connect
//
//  Created by Zhiyong Yang on 4/13/15.
//  Copyright (c) 2015 Andrew Yang. All rights reserved.
//

#import "XMPPIMConnection.h"

@implementation XMPPIMConnection

- (void)onMessageReceived:(IMMessage*)IMMessage{
    NSLog(@"New message received in XMPPIMConnection.");
}
@end
