//
//  UserModel.m
//  JUZ4Women
//
//  Created by Aakash sharma on 14/06/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

-(id)initWithUserId:(NSString *)userId withRealName:(NSString *)realName withDisplayName:(NSString *)displayName withEmailId:(NSString *)emailId withMobileNumber:(NSNumber *)mobileNumber withPassword:(NSString *)password withVerificationCode:(NSNumber *)code withDateModel:(DateModel *)dateModel withSignUpOption:(SignUpOption)option withCityName:(NSString *)city withCountry:(NSString *)country withImageUrl:(NSString *)imageUrl withUserName:(NSString *)userName withPostCount:(long)postCount withCommentsCount:(long)commentsCount withProfileViewsCount:(long)profileViewsCount withPostShareCount:(long)postShareCount withPostAnswerd:(long)postAnswerd withFavoriteArticle:(long)favoriteArticel withFavoriteVideos:(long)favoriteVideo withTotalRecommendation:(long)recommendation withTotalProfileLikes:(long)profileLikes withRatingStars:(long)ratingStars withArticleArray:(NSMutableArray *)articleArray withPostArray:(NSMutableArray *)postArray withAge:(long )age

{
    self = [super init];
    if(self)
    {
        self.realName = realName;
        self.displayName = displayName;
        self.emailAddress = emailId;
        self.mobileNumber = mobileNumber;
        self.password = password;
        self.verificationCode = code;
        self.dateOfBirth = dateModel;
        self.signUpOption = option;
        self.city = city;
        self.country = country;
        self.imageUrl = imageUrl;
        self.userName = userName;
        self.userTotalPostCount = postCount;
        self.userTotalComments = commentsCount;
        self.userTotalProfileViews = profileViewsCount;
        self.userTotalPostShares = postShareCount;
        self.uId = userId;
        self.userTotalPostAnswerd = postAnswerd;
        self.userTotalFavoriteArticle = favoriteArticel;
        self.userTotalFavoriteVideos = favoriteVideo;
        self.userTotalRecommendation = recommendation;
        self.userTotalprofileLikes = profileLikes;
        self.userTotalRatingStars = ratingStars;
        self.articleArray = articleArray;
        self.postArray = postArray;
        self.userAge = age;
    }
    return self;
}
@end
