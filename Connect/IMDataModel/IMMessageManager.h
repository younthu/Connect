//
//  IMMessageManager.h
//  Connect
//
//  Created by Zhiyong Yang on 4/9/15.
//  Copyright (c) 2015 Andrew Yang. All rights reserved.
//

#import "IMUser.h"

@interface IMMessageManager : NSObject<MessageReceivedDelegate>
+ (instancetype)sharedInstance;

@property (nonatomic)int unreadMessagesCount;
// FIXME: this is a testing interface, please fix it later.
- (NSArray*)getAllMessage;
@end
