//
//  RequestDictionaryGenerator.m
//  JUZ4Women
//
//  Created by Kailash on 6/14/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "JFWRequestDictionaryGenerator.h"
#import "JFWAppConstants.h"
#import "JFWLoginModel.h"
#import "UserModel.h"
#import "DateModel.h"
#import "JFWUtilities.h"

@implementation JFWRequestDictionaryGenerator

-(NSMutableDictionary *)createLoginRequestDictionary:(UserModel *)userModel
{
    NSMutableDictionary *dataDict = [[NSMutableDictionary alloc]init];
    
    [dataDict setObject:@"loginAuthentication" forKey:kRequestType];
    [dataDict setObject:@"vivekbansal" forKey:kUserName];
    [dataDict setObject:@"vivek123" forKey:kPassword];
    
    return dataDict;
}

-(NSMutableDictionary *)createLeftMenuRequestDictionary:(UserModel *)userModel
{
    NSMutableDictionary *dataDict = [[NSMutableDictionary alloc]init];
    NSString *uid = [[NSUserDefaults standardUserDefaults]objectForKey:kUid];
    NSString *userName = [[NSUserDefaults standardUserDefaults]objectForKey:kUserName];
    
    
    [dataDict setObject:@"getUserDetailsForMenu" forKey:kRequestType];
    [dataDict setObject:userName forKey:kUserName];
    [dataDict setObject:uid forKey:kUid];

    return dataDict;
}

-(NSMutableDictionary *)getSignUpRequestParameter:(UserModel *)userModel
{
    if (!userModel) {
        return nil;
    }
    
    NSMutableDictionary *dataDict = [[NSMutableDictionary alloc]init];
    
    [dataDict setObject:@"registerNewUser" forKey:kRequestType];
    
    if (userModel.realName)
        [dataDict setObject:userModel.realName forKey:kUserName];
    
    if (userModel.password)
        [dataDict setObject:userModel.password forKey:kPassword];
    
    if (userModel.displayName)
        [dataDict setObject:userModel.displayName forKey:kUserAlisName];
    
    if (userModel.emailAddress)
        [dataDict setObject:userModel.emailAddress forKey:kEmail];
    
    if (userModel.dateOfBirth)
    {
        [dataDict setObject:[NSString stringWithFormat:@"%d-%d-%d",userModel.dateOfBirth.yyyy,userModel.dateOfBirth.mm, userModel.dateOfBirth.dd] forKey:kDateOfBirth];
    }
    
    if (userModel.country)
        [dataDict setObject:userModel.country forKey:kCountry];
    
    if (userModel.city)
        [dataDict setObject:userModel.city forKey:kCity];
    
    if (userModel.signUpOption) {
        NSString *string = nil;
        
        if (userModel.signUpOption == MOBILE)
            string = @"mobile";
        else
            string = @"email";
        
        [dataDict setObject:string forKey:kSignUpType];
    }
    
    if (userModel.image)
    {
        
        [dataDict setObject:userModel.image forKey:kProfileImage];
    }
    
    if (userModel.mobileNumber) {
        [dataDict setObject:userModel.mobileNumber forKey:kPhoneNUmber];
    }
    
    if (userModel.image)
    {
        [dataDict setObject:[JFWUtilities encodeToBase64String:userModel.image] forKey:kUserProfileImage];
    }
    
    return dataDict;
}
-(NSMutableDictionary *)createFeedRequestDictionary:(JFWFeedsModel *)feedModel
{
    NSNumber *postId = [NSNumber numberWithInt:12];
    NSMutableDictionary *dataDict = [[NSMutableDictionary alloc]init];
    NSString *uid = [[NSUserDefaults standardUserDefaults]objectForKey:kUid];
     NSString *userName = [[NSUserDefaults standardUserDefaults]objectForKey:kUserName];
    
    [dataDict setObject:@"getPostScreenDetails" forKey:kRequestType];
    [dataDict setObject:userName forKey:kUserName];
    [dataDict setObject:uid forKey:kUid];
    [dataDict setObject:postId forKey:@"last_post_id"];

    return dataDict;
}

@end
