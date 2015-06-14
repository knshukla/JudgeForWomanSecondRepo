//
//  UserModel.h
//  JUZ4Women
//
//  Created by Aakash sharma on 14/06/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JFWAppConstants.h"

@class DateModel;

@interface UserModel : NSObject

@property(nonatomic, strong) NSString *userId;
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

@property (nonatomic,strong) NSString *userName;

@property (assign) long userTotalPostCount;
@property (assign) long userTotalComments;
@property (assign) long userTotalProfileViews;
@property (assign) long userTotalPostShares;


-(id)initWithUserId:(NSString *)userId withRealName:(NSString *)realName withDisplayName:(NSString *)displayName withEmailId:(NSString *)emailId withMobileNumber:(NSNumber *)mobileNumber withPassword:(NSString *)password withVerificationCode:(NSNumber *)code withDateModel:(DateModel *)dateModel withSignUpOption:(SignUpOption)option withCityName:(NSString *)city withCountry:(NSString *)country withImageUrl:(NSString *)imageUrl withUserName:(NSString *)userName withPostCount:(long)postCount withCommentsCount:(long)commentsCount withProfileViewsCount:(long)profileViewsCount withPostShareCount:(long)postShareCount;

@end
