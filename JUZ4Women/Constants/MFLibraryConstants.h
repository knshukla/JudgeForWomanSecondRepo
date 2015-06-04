//
//  MFLibraryConstants.h
//  MediaFoundryMobileAppLibrary
//
//  Created by Kailash on 09/08/14.
//  Copyright (c) 2014 Hostworks. All rights reserved.
//


/** Completion Block handler
 */
typedef void(^CompletionHandlerBlock)(NSMutableArray*, NSError*);
//typedef void (^SuccessBlock)(NSMutableArray *);
//typedef void (^FailureBlock)(NSError *);





//Base Url

//Test environment
//static NSString * const kBaseUrl = @"http://dev.affiliate1.mf.com/";

//Dev server environment with domain name
//static NSString * const kBaseUrl = @"http://affiliate-riaus.mf.com/";

//Dev server environment with public IP address
//static NSString * const kBaseUrl = @"http://172.28.61.50/";

//Pre production server environment
//static NSString * const kBaseUrl = @"http://riaus.pp.mediafoundry.com.au/";

//Production server environment
static NSString * const kBaseUrl = @"http://riaus.tv/";

//API names
#define kPageSize   10
static NSString * const kBlogApi = @"api/blog?items_per_page=%d&page=%ld";
static NSString * const kCommentListingApi = @"api/comment/%ld?items_per_page=%ld&page=%ld";
static NSString * const kPostCommentApi = @"comment";
static NSString * const kEventsApi = @"api/events?items_per_page=%d&page=%d";
static NSString * const kVideosApi = @"api/listVideo?items_per_page=%d&page=%d";
static NSString * const kAudiosApi = @"api/audio?items_per_page=%d&page=%d";
static NSString * const kMediaM3U8UrlIdApi = @"node/%ld.json";

static NSString * const kRelatedEventsApi = @"api/events/all/%d";
static NSString * const kRelatedVideosApi = @"api/listVideo/all/%d";
static NSString * const kRelatedAudiosApi = @"api/audio/all/%d";

static NSString * const kSearchEventsApi = @"api/search/live_event?keys=%@&items_per_page=%d&page=%d";
static NSString * const kSearchVideosApi = @"api/search/video?keys=%@&items_per_page=%d&page=%d";
static NSString * const kSearchBlogsApi = @"api/search/blog?keys=%@&items_per_page=%d&page=%d";
static NSString * const kSearchAudiosApi = @"api/search/audio?keys=%@&items_per_page=%d&page=%d";

static NSString * const kEventsCategoryApi = @"api/events/all/%d?items_per_page=%d&page=%d";
static NSString * const kVideosCategoryApi = @"api/listVideo/all/%d?items_per_page=%d&page=%d";
static NSString * const kAudiosCategoryApi = @"api/audio/all/%d?items_per_page=%d&page=%d";

static NSString * const kEventsAllCategoryApi = @"api/events/all?items_per_page=%d&page=%d";
static NSString * const kVideosAllCategoryApi = @"api/listVideo/all?items_per_page=%d&page=%d";
static NSString * const kAudiosAllCategoryApi = @"api/audio/all?items_per_page=%d&page=%d";

static NSString * const kUserLogInApi = @"restws/session/token";
static NSString * const kUserDetailsApi = @"api/getUser";
static NSString * const kUserLogoutApi = @"user/logout";

//Common keys for Web service response
static NSString * const kTotalRecordsKey = @"total_records";
static NSString * const kIdKey = @"id";
static NSString * const kThumbnailKey = @"thumbnail";
static NSString * const kFieldUploadVideoKey = @"field_upload_video";
static NSString * const kNidKey = @"nid";
static NSString * const kBodyKey = @"body";
static NSString * const kValueKey = @"value";
static NSString * const kTitleKey = @"title";
static NSString * const kVideos = @"Videos";
static NSString * const kEvents = @"Events";
static NSString * const kAudios = @"Audios";


//Common keys for Web service request headers
static NSString * const kCookie = @"Cookie";
static NSString * const kX_CSRF_TOKEN = @"X_CSRF_TOKEN";


//Alert view buttons
static NSString * const kOkTitle = @"OK";
static NSString * const kCancelTitle = @"Cancel";
static NSString * const kRetryTitle = @"Retry";
static NSString * const kMediafoundryTitle = @"RiAus TV";

//NSUserDefaults related
static NSString * const kSessionId = @"SessionId";
static NSString * const kToken = @"Token";
static NSString * const kUserLoggedIn = @"UserLoggedIn";
static NSString * const kRememberMeStatus = @"RememberMeStatus";


//Related to error handling
typedef NS_ENUM(NSInteger, MFErrorCode) {
    INVALID_DATA_ERROR_CODE = 5001,
    SERVER_ERROR_CODE = 5002,
    CONNECTION_ERROR_CODE = 5003,
    NO_NETWORK_ERROR_CODE = 1000,
    UNAUTHORISED_ERROR_CODE = 401,
    BAD_URL_ERROR_CODE = -1000,
    DATABASE_ERROR_CODE = 1,
    DOMAIN_ERROR_CODE = -1009,
    DOMAIN_UNAUTHORISED_ERROR_CODE = -1011,
    URL_DOMAIN_ERROR_CODE = -1100,
    URL_DOMAIN_CANCELLED_ERROR_CODE = -999
};

//Media List Api key
static NSString * const kNodesKey = @"nodes";


//Error message
static NSString * const kErrorTitle = @"Error";
static NSString * const kInvalidDataMessage = @"Invalid data from server";
static NSString * const kServerErrorMessage = @"Server error";
static NSString * const kUnauthorizedMessage = @"The request requires user authentication for internet connection.";
static NSString * const kBadUrlMessage = @"Bad URL";
static NSString * const kDatabaseErrorMessage = @"Error in retrieving data from database";
static NSString * const kDefaultErrorMessage = @"Error in retrieving data";
static NSString * const kDomainErrorMessage = @"Error in domain network or internet connection appears to be offline.";
static NSString * const kDomainUnauthorisedErrorMessage = @"Authentication error";
static NSString * const kUrlDomainErrorMessage = @"Error in playing media content.";
static NSString * const kUrlDomainCancelledErrorMessage = @"Request is being processed";
