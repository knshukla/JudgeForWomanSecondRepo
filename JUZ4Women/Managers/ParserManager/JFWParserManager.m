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
    JFWLeftMenuModel *leftMenuModel = [[JFWLeftMenuModel alloc]initWithUserAlisName:[responseDict objectForKey:kUserAlisName] withUserName:[responseDict objectForKey:kMenuUserName] withSuccess:[responseDict objectForKey:kSuccess] withUserPostCount:[[responseDict objectForKey:kUserTotalPost] longValue] withUserCommentsCount:[[responseDict objectForKey:kUserTotalComments] longValue] withProfileView:[[responseDict objectForKey:kUserTotalProfileViews] longValue] withPostCount:[[responseDict objectForKey:kUserTotalPostShares] longValue]];
    
    return leftMenuModel;
}

@end
