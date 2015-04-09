//
//  IMUserManager.h
//  Connect
//
//  Created by Zhiyong Yang on 4/9/15.
//  Copyright (c) 2015 Andrew Yang. All rights reserved.
//

#import "IMUser.h"

@interface IMUserManager : NSObject
+ (instancetype)sharedInstance;
- (IMUser*)getUserById:(NSString*)userId;
@end
