//
//  LeftMenuModel.m
//  JUZ4Women
//
//  Created by Kailash on 6/14/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "JFWLeftMenuModel.h"

@implementation JFWLeftMenuModel

-(id)initWithUserAlisName:(NSString *)userAlisName withUserName:(NSString *)userName withSuccess:(BOOL)success withUserPostCount:(int)postCount withUserCommentsCount:(int) commentCount withProfileView:(int) profileViews withPostShare:(int)postShare
{
    self = [super init];
    if(self)
    {
        self.userAlisName = userAlisName;
        self.userName = userName;
        self.success = success;
        self.userTotalPostCount = postCount;
        self.userTotalComments = commentCount;
        self.userTotalProfileViews = profileViews;
        self.userTotalPostShares = postCount;

    }
    return self;
}

@end
