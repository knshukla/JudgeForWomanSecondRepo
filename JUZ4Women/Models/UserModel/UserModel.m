//
//  UserModel.m
//  JUZ4Women
//
//  Created by Aakash sharma on 14/06/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

-(id)initWithUserId:(NSString *)userId withRealName:(NSString *)realName withDisplayName:(NSString *)displayName withEmailId:(NSString *)emailId withMobileNumber:(NSNumber *)mobileNumber withPassword:(NSString *)password withVerificationCode:(NSNumber *)code withDateModel:(DateModel *)dateModel withSignUpOption:(SignUpOption)option withCityName:(NSString *)city withCountry:(NSString *)country withImageUrl:(NSString *)imageUrl withUserName:(NSString *)userName withPostCount:(long)postCount withCommentsCount:(long)commentsCount withProfileViewsCount:(long)profileViewsCount withPostShareCount:(long)postShareCount

{
    self = [super init];
    if(self)
    {
        self.userId = userId;
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
    }
    return self;
}
@end
