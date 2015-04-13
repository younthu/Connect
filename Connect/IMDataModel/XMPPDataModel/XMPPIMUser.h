//
//  XMPPIMUser.h
//  Connect
//
//  Created by Zhiyong Yang on 4/13/15.
//  Copyright (c) 2015 Andrew Yang. All rights reserved.
//

#import "IMUser.h"
#import "BlockTypes.h"

@interface XMPPIMUser : IMUser
@property (nonatomic, copy) blockVoidVoid onLoginSucceed;
@property (nonatomic, copy) blockVoidVoid onLoginFailed;
@end
