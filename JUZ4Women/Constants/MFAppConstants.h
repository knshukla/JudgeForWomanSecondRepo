//
//  MFAppConstants.h
//  MediaFoundryMobileApp
//
//  Created by Cybage on 09/08/14.
//  Copyright (c) 2014 Hostworks. All rights reserved.
//


//iPhone View Controller Id
//static NSString * const kMFSignInViewControllerId = @"MFSignInViewControllerId";
static NSString * const kMFForgotPasswordViewControllerId = @"MFForgotPasswordViewControllerId";
static NSString * const kMFSignUpViewControllerId = @"MFSignUpViewControllerId";
static NSString * const kMFHomeViewControllerId = @"MFHomeViewControllerId";
static NSString * const kMFSplashViewControllerId = @"MFSplashViewControllerId";
static NSString * const kMFNavigationControllerID = @"MFNavigationControllerId";
static NSString * const kMFProfileViewControllerId = @"MFProfileViewControllerId";
static NSString * const kMFEditProfileViewControllerId = @"MFEditProfileViewControllerId";
static NSString * const kMFBlogListingViewControllerId = @"MFBlogListingViewControllerId";
static NSString * const kMFBlogDetailViewControllerId = @"MFBlogDetailViewControllerId";
static NSString * const kMFMenuViewControllerId = @"MFMenuViewControllerId";
static NSString * const kMFCommentsViewControllerId = @"MFCommentsViewControllerId";
static NSString * const kMFMediaListingViewControllerId = @"MFMediaListingViewControllerId";
static NSString * const kMFMediaDetailViewControllerId = @"MFMediaDetailViewControllerId";
static NSString * const kMFCartViewControllerId = @"MFCartViewControllerId";
static NSString * const kMFSearchViewControllerId = @"MFSearchViewControllerId";
static NSString * const kMFMySubscriptionsViewControllerId = @"MFMySubscriptionsViewControllerId";
static NSString * const kMFCategoryLandingViewControllerId = @"MFCategoryLandingViewControllerId";
static NSString * const kMFOrderHistoryViewControllerId = @"MFOrderHistoryViewControllerId";
static NSString * const kMFOrderDetailViewControllerId = @"MFOrderDetailViewControllerId";
static NSString * const kMFKnowUsBetterViewControllerId = @"MFKnowUsBetterViewControllerId";
static NSString * const kMFFavoritesViewControllerId = @"MFFavoritesViewControllerId";
static NSString * const kMFVideoPlayerViewControllerId = @"MFVideoPlayerViewControllerId";
static NSString * const kMFChromeCastViewControllerId = @"MFChromeCastViewControllerId";
static NSString * const kMFChromeCastDeviceViewControllerId = @"MFChromeCastDeviceViewControllerId";



// Flurry events name
static NSString * const HIGHLIGHTS_ON_TABLET = @"HIGHLIGHTS_ON_TABLET";
static NSString * const LIVE_EVENTS_ON_TABLET = @"LIVE_EVENTS_ON_TABLET";
static NSString * const HIGHLIGHTS_ON_PHONE = @"HIGHLIGHTS_ON_PHONE";
static NSString * const LIVE_EVENTS_ON_PHONE = @"LIVE_EVENTS_ON_PHONE";
static NSString * const HIGHLIGHTS_ON_CHROMCAST = @"HIGHLIGHTS_ON_PHONE";
static NSString * const LIVE_EVENTS_ON_CHROMCAST = @"LIVE_EVENTS_ON_PHONE";

//Collection view cell id
static NSString * const kMFMediaGridCellId = @"MFMediaGridCellId";
static NSString * const kMFMediaListCellId = @"MFMediaListCellId";
static NSString * const kMFMediaTopCellId = @"MFMediaTopCellId";
static NSString * const kMFMediaLoadMoreCellId = @"MFMediaLoadMoreCellId";

//Custom table view cell Id
static NSString * const kMFCommentsExpandCollapseCellId = @"MFCommentsExpandCollapseCellId";
static NSString * const kMFCommentsViewAllCellId = @"MFCommentsViewAllCellId";
static NSString * const kMFViewMoreCellId = @"MFViewMoreCellId";

//Font related constants
static NSString * const kHelveticaNeueMedium = @"HelveticaNeue-Medium";
static NSString * const kHelveticaNeueBold = @"HelveticaNeue-Bold";
static NSString * const kHelveticaNeueRegular = @"HelveticaNeue-Regular";
static NSString * const kHelvetica = @"Helvetica";

static NSString * const kChromeCastAppId = @"1C9494C0";

#define kFontSize10           10.0
#define kFontSize11           11.0
#define kFontSize13           13.0
#define kFontSize14           14.0
#define kFontSize15           15.0
#define kFontSize17           17.0
#define kFontSize18           18.0



static NSString * const kDefaultSponsorPlaceholderImage = @"sponsortile";

static NSString * const kGradientImage = @"story_bg_gradient.png";

static NSString * const kDefaultLiveEventPlaceholderImage = @"liveEventPlaceHolderImage.png";


//liveEventPlaceHolderImage
//
static NSString *const kMediaContentType = @"video/mp4";

#define kTitleBarBackgroundColor         [UIColor colorWithRed:30.0/255.0 green:34.0/255.0 blue:43.0/255.0 alpha:1.0]



//HomeViewController
//static NSString * const kHomeLogoImage_0 = @"7tennis_logo";

#define kCollectionViewBackgroundColor         [UIColor colorWithRed:33.0/255.0 green:33.0/255.0 blue:33.0/255.0 alpha:1.0]

//static NSString * const kCheckInternetConnectionMessage = @"Check your internet connection and tap to retry";

//Player related

static NSString *const kPlayerControllerId = @"MFVideoPlayerViewControllerId";
//Cell related constant

static NSString * const kHomeViewCellId = @"MFHomeViewCell";
static NSString * const kHighLightCellId = @"MFHighLightsCell";
static NSString * const kAllVideoCellId = @"MFAllVideoCell";
static NSString * const kViewMoreCellId = @"MFViewMoreCell";
static NSString *const kCollectionViewFooter = @"footer";
static NSString *const kCollectionViewHeader = @"header";
static NSString * const kSponsorCellId = @"MFSponsorCell";

//share option images

//Application type
typedef NS_ENUM(NSInteger, ApplicationType) {
    kFootball,
    kGolf,
    kRacing,
    kSwimming,
    kTennis
};

typedef NS_ENUM(NSInteger, StateType)
{
    kVIC,
    kTAS,
    kNSW,
    kQLD,
    kSA,
    kNT,
    kWA
    
};

typedef NS_ENUM(NSInteger, EventType) {
    kEventTypePrevious = 0,
    kEventTypeLive,
    kEventTypeUpcoming
};


//Api related constant
//http://hls-test.hostworks.com.au/intelligrape/response.json


//No Network

/*Webservice Response key*/

//VideoModal response keys
static NSString * const kvideoTitleKey = @"title";
static NSString * const kvideoCategoryKey = @"category";
static NSString * const kvideoThumbnailUrlKey = @"thumbnail";
static NSString * const kvideoM3U8UrlKey = @"m3u8";
static NSString * const kvideoChunklistMidKey = @"chunklist_mid";
static NSString * const kvideoNidKey = @"nid";

//EventModal response keys

static NSString * const kliveEventTitleKey = @"title";
static NSString * const kliveEventCategoryKey = @"category";
static NSString * const kliveEventThumbnailUrlKey = @"thumbnail";
static NSString * const kliveEventM3U8UrlKey = @"m3u8";
static NSString * const kliveEventChunklistMidKey = @"chunklist_mid";
static NSString * const kliveEventNidKey = @"nid";
static NSString * const kliveEventStartDateKey = @"start_date";
static NSString * const kliveEventEndDateKey = @"end_date";



//Application theme color codes
#define kFootballAppThemeColor        [UIColor colorWithRed:252.0/255.0 green:97.0/255.0 blue:31.0/255.0 alpha:1.0]

#define kGolfAppThemeColor         [UIColor colorWithRed:174.0/255.0 green:196.0/255.0 blue:18.0/255.0 alpha:1.0]

#define kRacingAppThemeColor         [UIColor colorWithRed:60.0/255.0 green:1.0/255.0 blue:59.0/255.0 alpha:1.0]

#define kSwimmingAppThemeColor         [UIColor colorWithRed:0.0/255.0 green:173.0/255.0 blue:201.0/255.0 alpha:1.0]

#define kTennisAppThemeColor         [UIColor colorWithRed:4.0/255.0 green:40.0/255.0 blue:66.0/255.0 alpha:1.0]



// Flurry events name
static NSString * const APP_START = @"APPLICATION_START";
static NSString * const APP_END = @"APPLICATION_END";
static NSString * const APP_ENTER_BACKGROUND = @"APPLICATION_ENTER_BACKGROUND";
static NSString * const VOD_PLAY_ON_IPad = @"VOD_PLAY_ON_IPAD";
static NSString * const LIVE_STREAM_PLAY_ON_IPAD = @"LIVE_STREAM_PLAY_ON_IPAD";
static NSString * const VOD_PLAY_ON_PHONE = @"VOD_PLAY_ON_IPHONE";
static NSString * const LIVE_STREAM_PLAY_ON_PHONE = @"LIVE_STREAM_PLAY_ON_IPHONE";
static NSString * const VOD_PLAY_ON_CHROMECAST = @"VOD_PLAY_ON_CHROMECAST";
static NSString * const LIVE_STREAM_PLAY_ON_CHROMECAST = @"LIVE_STREAM_PLAY_ON_CHROMECAST";

static NSString * const VOD_PAUSE_ON_IPAD = @"VOD_PAUSE_ON_IPAD";
static NSString * const LIVE_STREAM_PAUSE_ON_IPAD = @"LIVE_STREAM_PAUSE_ON_IPAD";
static NSString * const VOD_PAUSE_ON_PHONE = @"VOD_PAUSE_ON_IPHONE";
static NSString * const LIVE_STREAM_PAUSE_ON_PHONE = @"LIVE_STREAM_PAUSE_ON_IPHONE";
static NSString * const VOD_PAUSE_ON_CHROMECAST = @"VOD_PAUSE_ON_CHROMECAST";
static NSString * const LIVE_STREAM_PAUSE_ON_CHROMECAST = @"LIVE_STREAM_PAUSE_ON_CHROMECAST";

static NSString * const VOD_END_ON_IPAD = @"VOD_END_ON_IPAD";
static NSString * const LIVE_STREAM_END_ON_IPAD = @"LIVE_STREAM_END_ON_IPAD";
static NSString * const VOD_END_ON_PHONE = @"VOD_END_ON_IPHONE";
static NSString * const LIVE_STREAM_END_ON_PHONE = @"LIVE_STREAM_END_ON_IPHONE";
static NSString * const VOD_END_ON_CHROMECAST = @"VOD_END_ON_CHROMECAST";
static NSString * const LIVE_STREAM_END_ON_CHROMECAST = @"LIVE_STREAM_END_ON_CHROMECAST";
