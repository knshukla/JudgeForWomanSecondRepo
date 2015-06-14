//
//  MFAppConstants.h
//  MediaFoundryMobileApp
//
//  Created by Cybage on 09/08/14.
//  Copyright (c) 2014 Hostworks. All rights reserved.
//

// ENUMS

typedef NS_ENUM(NSInteger, SignUpScreenType)
{
    DATE_OF_BIRTH_SCREEN,
    SIGNUP_OPTION_TYPE_SCREEN,
    USERNAME_PASSWORD_SCREEN,
    SECURITY_CODE_SCREEN,
    LOCATION_SCREEN,
};

typedef NS_ENUM(NSInteger, SignUpOption)
{
    NONE,
    EMAIL,
    MOBILE
};

//iPhone View Controller Id
static NSString * const kMFSignInViewControllerId = @"MFSignInViewControllerId";

//Font related constants
static NSString * const kHelveticaNeue = @"HelveticaNeue";

//Webservice constants

//Login
static NSString * const kRequestType = @"requestType";
static NSString * const kUserName = @"username";
static NSString * const kUserTypeId = @"user_type_id";
static NSString * const kUid = @"uid";
static NSString * const kPassword = @"password";


//LeftMenu
static NSString * const kSuccess = @"success";
static NSString * const kUserAlisName = @"user_alias_name";
static NSString * const kUserTotalPost = @"user_total_posts";
static NSString * const kUserTotalComments = @"user_total_comments";
static NSString * const kUserTotalProfileViews = @"user_profile_views";
static NSString * const kUserTotalPostShares = @"user_total_post_shares";
static NSString * const kMenuUserName = @"user_name";



#define kFontSize18           18.0

//Search
static NSString * kSearchResultMessage = @"%d matches found";
static NSString * kNoSearchResultMessage = @"Sorry! No results found. Please try again.";

//common constants
#define kViewMoreCellHeight                                 30
static NSString * const ksubscribeToMediaFromWebsiteAlertMessage = @"Please subscribe to this media from website";
static NSString * const kEmptyPostAlertMessage = @"Post can not be empty";
static NSString * const kSearchAlertTitle = @"Search";
static NSString * const kWhiteSpacePostAlertMessage = @"Please enter valid comment.";

static NSString * const kDefaultMediaImage = @"Default-Media-640x390_0";



#define kSeparatorColor                  [UIColor colorWithRed:135.0/255.0 green:35.0/255.0 blue:142.0/255.0 alpha:1.0]
#define kTagsButtonBackgroundColor         [UIColor colorWithRed:145.0/255.0 green:112.0/255.0 blue:147.0/255.0 alpha:1.0]



//HomeViewController
static NSString * const kHomeLogoImage_0 = @"HomeLogo_0";

#define kCollectionViewBackgroundColor         [UIColor colorWithRed:33.0/255.0 green:33.0/255.0 blue:33.0/255.0 alpha:1.0]

static NSString * const kCheckInternetConnectionMessage = @"Check your internet connection and tap to retry";

//Player related

//Check your internet connection and tap to retry

//share option images
static NSString * const kMailNormalImage = @"mf_mail_0";
static NSString * const kMailTapImage = @"mf_mail_selected_0";
static NSString * const kFavoriteNormalImage = @"mf_addtofavorite_0";
static NSString * const kFavoriteTapImage = @"mf_addtofavorite_selected_0";

//Rating star images
static NSString * const kRatingSelectedImage_0 = @"mf_star_selected_0";
static NSString * const kRatingNotSelectedImage_0 = @"mf_star_non_selected_0";


//media landing screen common data
#define kGridBorderColor                  [UIColor colorWithRed:27.0/255.0 green:30.0/255.0 blue:35.0/255.0 alpha:1.0]

//Blog items color codes
//Use this color code for RiAus App
#define kAuthorTextColor         [UIColor colorWithRed:145.0/255.0 green:112.0/255.0 blue:147.0/255.0 alpha:1.0]
#define kReadMoreTitleColor         [UIColor colorWithRed:152.0/255.0 green:153.0/255.0 blue:154.0/255.0 alpha:1.0]


//Webview screen type
typedef NS_ENUM(NSInteger, WebViewScreenType) {
    kAboutUsScreen,
    kSignUpScreen,
    kEditProfileScreen,
    kForgotPasswordScreen,
    kChangePasswordScreen,
    kSignInWithFacebookScreen,
    kSignInWithTwitterScreen
};

//Api related constant

static NSString * const kMediaListApi = @"api/listVideo?items_per_page=11&page=0";
static NSString * const kMediaMoreListApi = @"api/listVideo?items_per_page=10&page=%d";

static NSString * const kBaseUrl = @"http://104.236.86.49/webservice.php";


//No Network
static NSString *const kNoNetworkMessage = @"Network connectivity is required for this application to work";
static NSString *const kAlertMessage = @"Alert";
static NSString *const kOKMessage = @"OK";

//User Sign Up
static NSString *const kUserLoggedInKey = @"isUserLoggedIn";


//Webservice blocks



