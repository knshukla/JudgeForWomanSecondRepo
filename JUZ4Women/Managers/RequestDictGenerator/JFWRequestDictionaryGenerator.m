//
//  RequestDictionaryGenerator.m
//  JUZ4Women
//
//  Created by Kailash on 6/14/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "JFWRequestDictionaryGenerator.h"
#import "JFWLoginModel.h"
#import "UserModel.h"
#import "DateModel.h"
#import "JFWUtilities.h"

#import "VideoModel.h"
#import "JFWFeedsModel.h"
#import "ArticleModel.h"
@implementation JFWRequestDictionaryGenerator

-(NSMutableDictionary *)createLoginRequestDictionary:(UserModel *)userModel
{
    NSMutableDictionary *dataDict = [[NSMutableDictionary alloc]init];
    
    [dataDict setObject:@"loginAuthentication" forKey:kRequestType];
    [dataDict setObject:userModel.realName forKey:kUserName];
    [dataDict setObject:userModel.password forKey:kPassword];
    //vivekbansal
    //vivek123
    
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

-(NSMutableDictionary *)createAddFeedRequestDictionary:(JFWFeedsModel *)feedModel
{
    NSNumber *postId = [NSNumber numberWithInt:12];
    NSMutableDictionary *dataDict = [[NSMutableDictionary alloc]init];
    NSString *uid = [[NSUserDefaults standardUserDefaults]objectForKey:kUid];
    NSString *userName = [[NSUserDefaults standardUserDefaults]objectForKey:kUserName];
    NSNumber *isAnonymus = [NSNumber numberWithBool:YES];
    
    [dataDict setObject:@"postNewPost" forKey:kRequestType];
    [dataDict setObject:userName forKey:kUserName];
    [dataDict setObject:uid forKey:kUid];
    [dataDict setObject:feedModel.postTitle forKey:@"post_title"];
    [dataDict setObject:feedModel.postDescription forKey:@"post_description"];
    [dataDict setObject:feedModel.tag1 forKey:@"post_tag_1"];
    [dataDict setObject:feedModel.tag2 forKey:@"post_tag_2"];
    [dataDict setObject:feedModel.tag3 forKey:@"post_tag_3"];
    [dataDict setObject:isAnonymus forKey:@"is_anonymous"];

//
    return dataDict;
}

-(NSMutableDictionary *)createVideoFeedRequestDictionary:(VideoModel *)videoModel
{
    NSNumber *postId = [NSNumber numberWithInt:1];

    NSMutableDictionary *dataDict = [[NSMutableDictionary alloc]init];
    
    NSString *uid = [[NSUserDefaults standardUserDefaults]objectForKey:kUid];
    NSString *userName = [[NSUserDefaults standardUserDefaults]objectForKey:kUserName];
    
    [dataDict setObject:@"getVideoScreenDetails" forKey:kRequestType];
    [dataDict setObject:userName forKey:kUserName];
    [dataDict setObject:uid forKey:kUid];
    [dataDict setObject:postId forKey:@"last_video_id"];
    return dataDict;

}

-(NSMutableDictionary *)createArticleFeedRequestDictionary:(ArticleModel *)articleModel
{
    NSNumber *postId = [NSNumber numberWithInt:1];
    
    NSMutableDictionary *dataDict = [[NSMutableDictionary alloc]init];
    
    NSString *uid = [[NSUserDefaults standardUserDefaults]objectForKey:kUid];
    NSString *userName = [[NSUserDefaults standardUserDefaults]objectForKey:kUserName];
    
    [dataDict setObject:@"getArticleScreenDetails" forKey:kRequestType];
    [dataDict setObject:userName forKey:kUserName];
    [dataDict setObject:uid forKey:kUid];
    [dataDict setObject:postId forKey:@"last_article_id"];
    return dataDict;
    
}

-(NSMutableDictionary *)createLegalAdviceFeedRequestDictionary:(ArticleModel *)articleModel
{
    NSNumber *postId = [NSNumber numberWithInt:0];
    
    NSMutableDictionary *dataDict = [[NSMutableDictionary alloc]init];
    
    NSString *uid = [[NSUserDefaults standardUserDefaults]objectForKey:kUid];
    NSString *userName = [[NSUserDefaults standardUserDefaults]objectForKey:kUserName];
    
    [dataDict setObject:@"getLegalAdviceScreenDetails" forKey:kRequestType];
    [dataDict setObject:userName forKey:kUserName];
    [dataDict setObject:uid forKey:kUid];
    [dataDict setObject:postId forKey:@"last_article_id"];
    return dataDict;
    
}


-(NSMutableDictionary *)createForgotPasswordRequestDictionary:(NSString *)password
{
    
    NSMutableDictionary *dataDict = [[NSMutableDictionary alloc]init];
    
    
    [dataDict setObject:@"forgetPassword" forKey:kRequestType];
    [dataDict setObject:password forKey:@"input_field"];
    return dataDict;
    
}

-(NSMutableDictionary *)createUserProfileRequestDictionary:(UserModel *)userModel
{
    NSMutableDictionary *dataDict = [[NSMutableDictionary alloc]init];
    
    NSString *uid = [[NSUserDefaults standardUserDefaults]objectForKey:kUid];
    NSString *userName = [[NSUserDefaults standardUserDefaults]objectForKey:kUserName];
    
    [dataDict setObject:@"getProfileScreenData" forKey:kRequestType];
    [dataDict setObject:userName forKey:kUserName];
    [dataDict setObject:uid forKey:kUid];
    return dataDict;
    
}

-(NSMutableDictionary *)getVideoLikeRequestDictionary:(VideoModel *)videoModelObj andInspiredValue:(LikeInspiredValue) inspiredValue
{
    if (!videoModelObj) {
        return nil;
    }
    
    NSString *uid = [[NSUserDefaults standardUserDefaults]objectForKey:kUid];
    NSString *userName = [[NSUserDefaults standardUserDefaults]objectForKey:kUserName];
    
    NSMutableDictionary *postData = [[NSMutableDictionary alloc]init];
    
    [postData setObject:@"getLikeDislikeForVideos" forKey:kRequestType];
    
    [postData setObject:userName forKey:kUserName];
    [postData setObject:uid forKey:kUid];
    
    [postData setObject:[NSString stringWithFormat:@"%d",videoModelObj.videoId] forKey:kVideoID];
    
    switch (inspiredValue)
    {
        case Like:
            [postData setObject:@"like" forKey:kLikeInspiredValue];
            break;
        
        case Inspired:
            [postData setObject:@"inspired" forKey:kLikeInspiredValue];

        default:
            break;
    }
    
    return postData;
}


-(NSMutableDictionary *)getArticleLikeRequestDictionary:(ArticleModel *)articleModelObj andInspiredValue:(LikeInspiredValue) inspiredValue
{
    if (!articleModelObj) {
        return nil;
    }
    
    NSString *uid = [[NSUserDefaults standardUserDefaults]objectForKey:kUid];
    NSString *userName = [[NSUserDefaults standardUserDefaults]objectForKey:kUserName];
    
    NSMutableDictionary *postData = [[NSMutableDictionary alloc]init];
    
    [postData setObject:@"getLikeDislikeForArticles" forKey:kRequestType];
    
    [postData setObject:userName forKey:kUserName];
    [postData setObject:uid forKey:kUid];
    
    [postData setObject:[NSString stringWithFormat:@"%d",articleModelObj.articleId] forKey:kVideoID];
    
    switch (inspiredValue)
    {
        case Like:
            [postData setObject:@"like" forKey:kLikeInspiredValue];
            break;
            
        case Inspired:
            [postData setObject:@"inspired" forKey:kLikeInspiredValue];
            
        default:
            break;
    }
    
    return postData;
}
@end
