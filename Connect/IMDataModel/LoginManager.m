//
//  LoginManager.m
//  Connect
//
//  Created by Zhiyong Yang on 4/8/15.
//  Copyright (c) 2015 Andrew Yang. All rights reserved.
//

#import "LoginManager.h"

@implementation LoginManager
- (void)LoginUser:(NSString *)userName password:(NSString *)password success:(void (^)())success failure:(void (^)(NSError *))failure{
    @throw @"Implement it in subclass please";
}

- (void)disconnect{
    @throw @"Implement it in subclass please";
}
@end
