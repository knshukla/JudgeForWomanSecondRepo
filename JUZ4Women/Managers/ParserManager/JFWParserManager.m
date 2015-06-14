//
//  MFParserManager.m
//  MediaFoundryMobileApp
//
//  Created by Kailash on 4/18/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "JFWParserManager.h"
#import "JFWLoginModel.h"
#import "JFWAppConstants.h"
#import "JFWLeftMenuModel.h"
@implementation JFWParserManager

-(JFWLoginModel *)parseLoginResponseWith:(NSDictionary *)responseDict
{
    JFWLoginModel *loginModel = [[JFWLoginModel alloc]initWithUserName:[responseDict objectForKey:kUserName] withPassword:nil withUid:[responseDict objectForKey:kUid] withUserTypeId:(int)[responseDict objectForKey:kUserTypeId]];
    
    return loginModel;

}

-(JFWLeftMenuModel *)parseLeftMenuResponseWith:(NSDictionary *)responseDict
{
    JFWLeftMenuModel *leftMenuModel = [[JFWLeftMenuModel alloc]initWithUserAlisName:[responseDict objectForKey:kUserAlisName] withUserName:[responseDict objectForKey:kUserName] withSuccess:[responseDict objectForKey:kSuccess] withUserPostCount:(int)[responseDict objectForKey:kUserTotalPost] withUserCommentsCount:(int)[responseDict objectForKey:kUserTotalComments] withProfileView:(int)[responseDict objectForKey:kUserTotalProfileViews] withPostCount:(int)[responseDict objectForKey:kUserTotalPostShares]];
    
    return leftMenuModel;
}

@end
