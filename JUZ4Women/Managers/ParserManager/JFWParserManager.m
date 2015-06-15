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
#import "JFWFeedsModel.h"
#import "VideoModel.h"

@implementation JFWParserManager

-(UserModel *)parseLoginResponseWith:(NSDictionary *)responseDict
{
    UserModel *userModel = [[UserModel alloc]initWithUserId:[responseDict objectForKey:kUid] withRealName:nil withDisplayName:nil withEmailId:nil withMobileNumber:nil withPassword:nil withVerificationCode:nil withDateModel:nil withSignUpOption:0 withCityName:nil withCountry:nil withImageUrl:nil withUserName:[responseDict objectForKey:kUserName] withPostCount:0.0 withCommentsCount:0.0 withProfileViewsCount:0.0 withPostShareCount:0.0];
    
    return userModel;

}

-(UserModel *)parseLeftMenuResponseWith:(NSDictionary *)responseDict
{
    NSString *imageUrl = [responseDict objectForKey:@"user_profile_picture"];
    UserModel *userModel = [[UserModel alloc]initWithUserId:nil withRealName:nil withDisplayName:[responseDict objectForKey:kUserAlisName] withEmailId:nil withMobileNumber:nil withPassword:nil withVerificationCode:nil withDateModel:nil withSignUpOption:0 withCityName:nil withCountry:nil withImageUrl:imageUrl withUserName:[responseDict objectForKey:kMenuUserName] withPostCount:[[responseDict objectForKey:kUserTotalPost] longValue] withCommentsCount:[[responseDict objectForKey:kUserTotalComments] longValue] withProfileViewsCount:[[responseDict objectForKey:kUserTotalProfileViews] longValue] withPostShareCount:[[responseDict objectForKey:kUserTotalPostShares] longValue]];

    
    return userModel;
}

-(NSMutableArray *)parseFeedsResponseWith:(NSDictionary *)responseDict
{
    NSMutableArray *feedsArray = [[NSMutableArray alloc]init];
    
    NSArray *dataArray = [responseDict objectForKey:@"responseArray"];
    
    for(NSDictionary *dict in dataArray)
    {
        NSString *tagString = [dict objectForKey:@"tags"];
        if([tagString isEqual:[NSNull null]])
        {
            tagString = @"";
        }
        JFWFeedsModel *feedModel = [[JFWFeedsModel alloc]initWithPostId:[[dict objectForKey:@"post_id"] intValue] withLikeCount:[[dict objectForKey:@"no_of_likes"] longValue] withDislikeCount:[[dict objectForKey:@"no_of_dislikes"] longValue]withcommentsCount:[[dict objectForKey:@"post_no_of_comments"] longValue] withPostTitle:[dict objectForKey:@"post_title"] withTags:tagString withUserAvatorUrl:[dict objectForKey:@"user_profile_pic"] withTag1:nil withTag2:nil withTag3:nil withPostDescription:nil];
        
        [feedsArray addObject:feedModel];
    }
    return feedsArray;
}


-(NSMutableArray *)parseVideoFeedsResponseWith:(NSDictionary *)responseDict
{
    NSMutableArray *feedsArray = [[NSMutableArray alloc]init];
    
    NSArray *dataArray = [responseDict objectForKey:@"responseArray"];
    
    for(NSDictionary *dict in dataArray)
    {
        VideoModel *videoModel = [[VideoModel alloc]initWithVideoName:[dict objectForKey:@"name"] withVideoUrl:[dict objectForKey:@"url"] withVideoTags:[dict objectForKey:@"tags"] withVideoLikes:[[dict objectForKey:@"likes"] longValue] withVideoInspires:[[dict objectForKey:@"inspire"] longValue] withVideoId:[[dict objectForKey:@"id"] intValue] withDescription:[dict objectForKey:@"description"] withThumbnailUrl:[dict objectForKey:@"thumbnail_url"]];
        
        [feedsArray addObject:videoModel];
    }
    return feedsArray;
}

@end
