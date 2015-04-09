//
//  IMUserManager.m
//  Connect
//
//  Created by Zhiyong Yang on 4/9/15.
//  Copyright (c) 2015 Andrew Yang. All rights reserved.
//

#import "IMUserManager.h"

@implementation IMUserManager
- (IMUser*)getUserById:(NSString *)userId{
    IMUser *user = [[IMUser alloc]init];
    user.userId = userId;
    return user;
}
@end
