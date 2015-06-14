//
//  RequestDictionaryGenerator.h
//  JUZ4Women
//
//  Created by Kailash on 6/14/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JFWLoginModel;
@class JFWLeftMenuModel;
@class UserModel;
@interface JFWRequestDictionaryGenerator : NSObject

-(NSMutableDictionary *)createLoginRequestDictionary:(UserModel *)userModel;

-(NSMutableDictionary *)createLeftMenuRequestDictionary:(UserModel *)userModel;

@end
