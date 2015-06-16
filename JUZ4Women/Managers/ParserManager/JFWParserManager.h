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
@class VideoModel;
@interface JFWParserManager : NSObject


+(UserModel *)parseLoginResponseWith:(NSDictionary *)responseDict;
+(UserModel *)parseLeftMenuResponseWith:(NSDictionary *)responseDict;
+(NSMutableArray *)parseFeedsResponseWith:(NSDictionary *)responseDict;

+(NSMutableArray *)parseVideoFeedsResponseWith:(NSDictionary *)responseDict;



@end
