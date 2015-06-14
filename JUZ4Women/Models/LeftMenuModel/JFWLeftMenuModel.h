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
@property (assign) long userTotalPostCount;
@property (assign) long userTotalComments;
@property (assign) long userTotalProfileViews;
@property (assign) long userTotalPostShares;

-(id)initWithUserAlisName:(NSString *)userAlisName withUserName:(NSString *)userName withSuccess:(BOOL)success withUserPostCount:(long)postCount withUserCommentsCount:(long) commentCount withProfileView:(long) profileViews withPostCount:(long)postShareCount;

@end
