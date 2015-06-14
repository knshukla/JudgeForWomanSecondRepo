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
#import "UserModel.h"

@implementation JFWParserManager

-(UserModel *)parseLoginResponseWith:(NSDictionary *)responseDict
{
    UserModel *userModel = [[UserModel alloc]initWithUserId:[responseDict objectForKey:kUid] withRealName:nil withDisplayName:nil withEmailId:nil withMobileNumber:nil withPassword:nil withVerificationCode:nil withDateModel:nil withSignUpOption:0 withCityName:nil withCountry:nil withImageUrl:nil withUserName:[responseDict objectForKey:kUserName] withPostCount:0.0 withCommentsCount:0.0 withProfileViewsCount:0.0 withPostShareCount:0.0];
    
    return userModel;

}

-(UserModel *)parseLeftMenuResponseWith:(NSDictionary *)responseDict
{
    UserModel *userModel = [[UserModel alloc]initWithUserId:nil withRealName:nil withDisplayName:[responseDict objectForKey:kUserAlisName] withEmailId:nil withMobileNumber:nil withPassword:nil withVerificationCode:nil withDateModel:nil withSignUpOption:0 withCityName:nil withCountry:nil withImageUrl:nil withUserName:[responseDict objectForKey:kMenuUserName] withPostCount:[[responseDict objectForKey:kUserTotalPost] longValue] withCommentsCount:[[responseDict objectForKey:kUserTotalComments] longValue] withProfileViewsCount:[[responseDict objectForKey:kUserTotalProfileViews] longValue] withPostShareCount:[[responseDict objectForKey:kUserTotalPostShares] longValue]];

    
    return userModel;
}

@end
