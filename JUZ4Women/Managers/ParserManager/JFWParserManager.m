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
#import "ArticleModel.h"
#import "PollModel.h"

@implementation JFWParserManager

+(UserModel *)parseLoginResponseWith:(NSDictionary *)responseDict
{
    UserModel *userModel = [[UserModel alloc]initWithUserId:[responseDict objectForKey:kUid] withRealName:nil withDisplayName:nil withEmailId:nil withMobileNumber:nil withPassword:nil withVerificationCode:nil withDateModel:nil withSignUpOption:0 withCityName:nil withCountry:nil withImageUrl:nil withUserName:[responseDict objectForKey:kUserName] withPostCount:0.0 withCommentsCount:0.0 withProfileViewsCount:0.0 withPostShareCount:0.0 withPostAnswerd:0.0 withFavoriteArticle:0.0 withFavoriteVideos:0.0 withTotalRecommendation:0.0 withTotalProfileLikes:0.0 withRatingStars:0.0 withArticleArray:nil withPostArray:nil withAge:0.0];
    
    return userModel;

}

+(UserModel *)parseLeftMenuResponseWith:(NSDictionary *)responseDict
{
    NSString *imageUrl = [responseDict objectForKey:@"user_profile_picture"];
    UserModel *userModel = [[UserModel alloc]initWithUserId:nil withRealName:nil withDisplayName:[responseDict objectForKey:kUserAlisName] withEmailId:nil withMobileNumber:nil withPassword:nil withVerificationCode:nil withDateModel:nil withSignUpOption:0 withCityName:nil withCountry:nil withImageUrl:imageUrl withUserName:[responseDict objectForKey:kMenuUserName] withPostCount:[[responseDict objectForKey:kUserTotalPost] longValue] withCommentsCount:[[responseDict objectForKey:kUserTotalComments] longValue] withProfileViewsCount:[[responseDict objectForKey:kUserTotalProfileViews] longValue] withPostShareCount:[[responseDict objectForKey:kUserTotalPostShares] longValue] withPostAnswerd:0.0 withFavoriteArticle:0.0 withFavoriteVideos:0.0 withTotalRecommendation:0.0 withTotalProfileLikes:0.0 withRatingStars:0.0 withArticleArray:nil withPostArray:nil withAge:0.0];

    
    return userModel;
}


+(NSMutableArray *)parseFeedsResponseWith:(NSDictionary *)responseDict
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
        JFWFeedsModel *feedModel = [[JFWFeedsModel alloc]initWithPostId:[[dict objectForKey:@"post_id"] intValue] withLikeCount:[[dict objectForKey:@"no_of_likes"] longValue] withDislikeCount:[[dict objectForKey:@"no_of_dislikes"] longValue]withcommentsCount:[[dict objectForKey:@"post_no_of_comments"] longValue] withPostTitle:[dict objectForKey:@"post_title"] withTags:tagString withUserAvatorUrl:[dict objectForKey:@"user_profile_pic"] withTag1:nil withTag2:nil withTag3:nil withPostDescription:[dict objectForKey:@"post_title"] withPostDate:[dict objectForKey:@"post_date"] withPostTime:[dict objectForKey:@"post_time"]];
        
        [feedsArray addObject:feedModel];
    }
    return feedsArray;
}


+(NSMutableArray *)parseVideoFeedsResponseWith:(NSDictionary *)responseDict
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

+(NSMutableArray *)parseArticleFeedsResponseWith:(NSDictionary *)responseDict
{
    NSMutableArray *feedsArray = [[NSMutableArray alloc]init];
    
    NSArray *dataArray = [responseDict objectForKey:@"responseArray"];
    
    for(NSDictionary *dict in dataArray)
    {
        ArticleModel *articleModel = [[ArticleModel alloc]initWithArticleTitle:[dict objectForKey:@"article_title"] withDate:[dict objectForKey:@"article_date"] withArticleTags:[dict objectForKey:@"tags"] withArticleLikes:[[dict objectForKey:@"article_like_count"] longValue] withArticleInspires:[[dict objectForKey:@"article_inspired_count"] longValue]withAritcleId:[[dict objectForKey:@"article_id"] intValue]withDescription:[dict objectForKey:@"article_description"] withThumbnailUrl:[dict objectForKey:@"user_profile_pic"] withConclusion:[dict objectForKey:@"article_conclusion"] withPostComment:[[dict objectForKey:@"post_no_of_comments"]longValue] withTime:[dict objectForKey:@"article_time"]];
        
        [feedsArray addObject:articleModel];
    }
    return feedsArray;
}

+(UserModel *)parseUserProfileResponseWith:(NSDictionary *)profileResponseDict
{
    NSDictionary *responseDict = [profileResponseDict objectForKey:@"basic_details"];
    NSArray *articleArray = [profileResponseDict objectForKey:@"articlesArray"];
    NSArray *postDataArray = [profileResponseDict objectForKey:@"postArray"];
    
    
    NSMutableArray *articleDataArray = [[NSMutableArray alloc]init];

    for(NSDictionary *dict in articleArray)
    {
        ArticleModel *articleModel = [[ArticleModel alloc]initWithArticleTitle:[dict objectForKey:@"article_title"] withDate:[dict objectForKey:@"article_date"] withArticleTags:[dict objectForKey:@"tags"] withArticleLikes:[[dict objectForKey:@"article_like_count"] longValue] withArticleInspires:[[dict objectForKey:@"article_inspired_count"] longValue]withAritcleId:[[dict objectForKey:@"article_id"] intValue]withDescription:[dict objectForKey:@"article_description"] withThumbnailUrl:[dict objectForKey:@"user_profile_pic"] withConclusion:[dict objectForKey:@"article_conclusion"] withPostComment:[[dict objectForKey:@"post_no_of_comments"]longValue] withTime:[dict objectForKey:@"article_time"]];
        
        [articleDataArray addObject:articleModel];
    }
    
    NSMutableArray *postArray = [[NSMutableArray alloc]init];
    
    
    for(NSDictionary *dict in postDataArray)
    {
        NSString *tagString = [dict objectForKey:@"tags"];
        if([tagString isEqual:[NSNull null]])
        {
            tagString = @"";
        }
        JFWFeedsModel *feedModel = [[JFWFeedsModel alloc]initWithPostId:[[dict objectForKey:@"post_id"] intValue] withLikeCount:[[dict objectForKey:@"no_of_likes"] longValue] withDislikeCount:[[dict objectForKey:@"no_of_dislikes"] longValue]withcommentsCount:[[dict objectForKey:@"post_no_of_comments"] longValue] withPostTitle:[dict objectForKey:@"post_title"] withTags:tagString withUserAvatorUrl:[dict objectForKey:@"user_profile_pic"] withTag1:nil withTag2:nil withTag3:nil withPostDescription:nil withPostDate:nil withPostTime:nil];
        
        [postArray addObject:feedModel];
    }



    
    NSString *imageUrl = [responseDict objectForKey:@"user_profile_picture"];
    UserModel *userModel = [[UserModel alloc]initWithUserId:nil withRealName:kMenuUserName withDisplayName:[responseDict objectForKey:kUserAlisName] withEmailId:nil withMobileNumber:nil withPassword:nil withVerificationCode:nil withDateModel:nil withSignUpOption:0 withCityName:nil withCountry:nil withImageUrl:imageUrl withUserName:[responseDict objectForKey:kMenuUserName] withPostCount:[[responseDict objectForKey:kUserTotalPost] longValue] withCommentsCount:[[responseDict objectForKey:kUserTotalComments] longValue] withProfileViewsCount:[[responseDict objectForKey:kUserTotalProfileViews] longValue] withPostShareCount:[[responseDict objectForKey:kUserTotalPostShares] longValue] withPostAnswerd:[[responseDict objectForKey:@"user_total_post_answered"] longValue] withFavoriteArticle:[[responseDict objectForKey:@"user_total_favorite_articles"] longValue] withFavoriteVideos:[[responseDict objectForKey:@"user_total_favorite_videos"] longValue] withTotalRecommendation:0.0 withTotalProfileLikes:0.0 withRatingStars:0.0 withArticleArray:articleDataArray withPostArray:postArray withAge:[[responseDict objectForKey:@"user_dob"]longValue]];
    
    
    return userModel;

}

+(NSMutableArray *)parsePollsResponseWith:(NSDictionary *)responseData
{
    if (!responseData && ![responseData isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    NSMutableArray *pollsArray = [[NSMutableArray alloc]init];
    
    NSArray *dataArray = [responseData objectForKey:@"responseArray"];
    
    for(NSDictionary *dict in dataArray)
    {
        PollModel *pollModel = [[PollModel alloc]initWithPollId:[dict valueForKey:kPollId] tag:[dict valueForKey:kTags] responses:(long)[dict valueForKey:kResponses] status:[[dict valueForKey:kStatus] intValue] question:[dict valueForKey:kPollQuestion] startDate:[dict valueForKey:kStartDate] startTime:[dict valueForKey:kStartTime] Option1:[dict valueForKey:kOption1] option2:[dict valueForKey:kOption2] option3:[dict valueForKey:kOption3] option4:[dict valueForKey:kOption4]];
        
        [pollsArray addObject:pollModel];
    }
    
    return pollsArray;
}

@end
