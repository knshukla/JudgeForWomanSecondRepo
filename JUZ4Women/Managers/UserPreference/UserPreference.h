//
//  UserPreference.h
//  JUZ4Women
//
//  Created by Aakash sharma on 02/05/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserPreference : NSObject

+ (instancetype)sharedInstance;

-(BOOL)isUserLoggedin;

@end
