//
//  MFParserManager.h
//  MediaFoundryMobileApp
//
//  Created by Kailash on 4/18/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JFWLoginModel;
@class JFWLeftMenuModel;
@class UserModel;

@interface JFWParserManager : NSObject

-(UserModel *)parseLoginResponseWith:(NSDictionary *)responseDict;
-(UserModel *)parseLeftMenuResponseWith:(NSDictionary *)responseDict;

@end
