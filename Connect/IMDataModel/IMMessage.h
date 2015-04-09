//
//  IMMessage.h
//  Connect
//
//  Created by Zhiyong Yang on 4/9/15.
//  Copyright (c) 2015 Andrew Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class IMUser;
typedef enum : NSUInteger {
    IMMessageStatusSending,
    IMMessageStatusFailed,
    IMMessageSent,
    IMMessageRevoking,
    IMMessageRevoked,
    IMMessageRevokeFailed
} IMMessageStatus;

@interface IMMessage : NSObject
@property (nonatomic, strong) IMUser *from;
@property (nonatomic, strong) NSDate *sent;
@property (nonatomic) IMMessageStatus messageStatus;
@property (nonatomic, strong) IMUser *to;
@end
