//
//  UserPreference.m
//  JUZ4Women
//
//  Created by Aakash sharma on 02/05/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "UserPreference.h"
#import "JFWUtilities.h"
#import "JFWAppConstants.h"

@implementation UserPreference

+ (instancetype)sharedInstance
{
    static dispatch_once_t once;
    static UserPreference *sharedInstance;
    
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

-(BOOL)isUserLoggedin
{
    BOOL loggedIn = [JFWUtilities getBoolFromUserDefaultForkey:kUserLoggedInKey];
    
    return loggedIn;
}

@end
