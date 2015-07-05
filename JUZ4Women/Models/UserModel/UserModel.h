//
//  UserModel.h
//  JUZ4Women
//
//  Created by Kailash on 14/06/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JFWAppConstants.h"
#import <UIKit/UIKit.h>

@class DateModel;

@interface UserModel : NSObject

@property(nonatomic, strong) NSString *realName;

@property(nonatomic, strong) NSString *displayName;
@property(nonatomic, strong) NSString *emailAddress;

@property(nonatomic, strong) NSNumber *mobileNumber;
@property(nonatomic, strong) NSString *password;

@property(nonatomic, strong) NSNumber *verificationCode;
@property(nonatomic, strong) DateModel *dateOfBirth;

@property(nonatomic, assign) SignUpOption signUpOption;
@property(nonatomic, strong) NSString *city;

@property(nonatomic, strong) NSString *country;
@property (nonatomic ,strong) NSString *imageUrl;

@property(nonatomic, strong) UIImage *image;

@property (nonatomic,strong) NSString *userName;
@property (nonatomic,strong) NSString *uId;
@property (assign) long userAge;



@property (assign) long userTotalPostCount;
@property (assign) long userTotalComments;
@property (assign) long userTotalProfileViews;
@property (assign) long userTotalPostShares;
@property (assign) long userTotalPostAnswerd;
@property (assign) long userTotalFavoriteArticle;
@property (assign) long userTotalFavoriteVideos;
@property (assign) long userTotalRecommendation;
@property (assign) long userTotalprofileLikes;
@property (assign) long userTotalRatingStars;


@property (nonatomic,strong) NSMutableArray *articleArray;
@property (nonatomic,strong) NSMutableArray *postArray;



-(id)initWithUserId:(NSString *)userId withRealName:(NSString *)realName withDisplayName:(NSString *)displayName withEmailId:(NSString *)emailId withMobileNumber:(NSNumber *)mobileNumber withPassword:(NSString *)password withVerificationCode:(NSNumber *)code withDateModel:(DateModel *)dateModel withSignUpOption:(SignUpOption)option withCityName:(NSString *)city withCountry:(NSString *)country withImageUrl:(NSString *)imageUrl withUserName:(NSString *)userName withPostCount:(long)postCount withCommentsCount:(long)commentsCount withProfileViewsCount:(long)profileViewsCount withPostShareCount:(long)postShareCount withPostAnswerd:(long)postAnswerd withFavoriteArticle:(long)favoriteArticel withFavoriteVideos:(long)favoriteVideo withTotalRecommendation:(long)recommendation withTotalProfileLikes:(long)profileLikes withRatingStars:(long)ratingStars withArticleArray:(NSMutableArray *)articleArray withPostArray:(NSMutableArray *)postArray withAge:(long )age;

@end
