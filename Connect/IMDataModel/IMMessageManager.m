//
//  IMMessageManager.m
//  Connect
//
//  Created by Zhiyong Yang on 4/9/15.
//  Copyright (c) 2015 Andrew Yang. All rights reserved.
//

#import "IMMessageManager.h"
#import "IMConnection.h"
static IMMessageManager *_sharedManager;
@interface IMMessageManager()
@property (nonatomic,strong) NSMutableArray *allMessages;
@end
@implementation IMMessageManager

+ (instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[ IMMessageManager alloc]init];
    });
    return _sharedManager;
}
- (instancetype)init{
    if (self = [super init]) {
        _allMessages = [NSMutableArray array];
    }
    return self;
}
#pragma mark - MessageReceivedDelegate
- (void)onIMMessageReceived:(IMMessage*)message{
    NSLog(@"Message Received in IMMessageManager.");
    [_allMessages addObject:message];
    self.unreadMessagesCount++;
}
- (NSArray*)getAllMessage{
    return _allMessages;
}
@end
