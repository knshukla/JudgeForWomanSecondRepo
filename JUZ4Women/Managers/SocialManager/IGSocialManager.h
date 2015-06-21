//
//  TwitterManager.h
//  Twitter Login
//
//  Created by Ashu on 01/08/14.
//  Copyright (c) 2014 Ashu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GooglePlus/GooglePlus.h>

@protocol SocialManagerDelegate <NSObject>

-(void)onGooglePlusLoginDoneWithData :(id)jsonResponseData withError:(NSError *)error;

@end

typedef enum{
    SocialManagerTypeFacebook,
    SocialManagerTypeTwitter
}SocialManagerType;

@interface IGSocialManager : NSObject

@property(nonatomic,weak) id<SocialManagerDelegate> socialLoginDelegate;
@property(readonly,nonatomic) NSString *refreshTokenGoogle;
@property(readonly,nonatomic) NSString *accessTokenGoogle;
@property(readonly,nonatomic) NSString *userIdTwitter;
@property(readonly,nonatomic) NSString *screenNameTwitter;
@property(readonly,nonatomic) NSString *accessTokenTwitter;


-(id)initWithType:(SocialManagerType)type;
// Method used to login on facebook or twitter
-(void)socialLogin;
// Method used to share post on facebook or twitter
-(void)socialSharing:(NSString *)text withImageName:(NSString *)imageName andController:(UIViewController *)topController;
// Method used to login on google+
-(void)googlePlusLogin;
// Method used to share post on google+
-(void)googleShare:(NSString *)msg andImage:(UIImage *)image;
// Method used to fetch people list in circles of current logged user on google+
-(void)fetchPeopleInCircles;
// Method used to fetch profile information of current logged user on google+
-(void)fetchProfileInformation;
// Method used to signout on google+
-(void)signOutGooglePlus;


-(void)getRequestToken;

@end



