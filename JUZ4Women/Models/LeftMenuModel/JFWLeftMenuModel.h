//
//  LeftMenuModel.h
//  JUZ4Women
//
//  Created by Kailash on 6/14/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JFWLeftMenuModel : NSObject

@property (assign) BOOL success;
@property (nonatomic) NSString *userAlisName;
@property (nonatomic) NSString *userName;
@property (assign) int userTotalPostCount;
@property (assign) int userTotalComments;
@property (assign) int userTotalProfileViews;
@property (assign) int userTotalPostShares;

-(id)initWithUserAlisName:(NSString *)userAlisName withUserName:(NSString *)userName withSuccess:(BOOL)success withUserPostCount:(int)postCount withUserCommentsCount:(int) commentCount withProfileView:(int) profileViews withPostCount:(int)postShareCount;

@end
