//
//  DemoMessagesViewController+XMPPDemo.h
//  Connect
//
//  Created by Zhiyong Yang on 4/14/15.
//  Copyright (c) 2015 Andrew Yang. All rights reserved.
//

#import "DemoMessagesViewController.h"

@interface DemoMessagesViewController (XMPPDemo)
- (IMUser*)loginUser:(NSString*)userName password:(NSString*)password;
@end
