//
//  ChatSession.h
//  Connect
//
//  Created by Zhiyong Yang on 4/9/15.
//  Copyright (c) 2015 Andrew Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMUser.h"

@interface ChatSession : NSObject
@property NSArray *participants; // participants
@property (nonatomic, strong) NSArray *history;// chat history
@end
