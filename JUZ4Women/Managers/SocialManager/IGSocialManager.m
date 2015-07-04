//
//  TwitterManager.m
//  Twitter Login
//
//  Created by Ashu on 01/08/14.
//  Copyright (c) 2014 Ashu. All rights reserved.
//

#import "IGSocialManager.h"
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import "Constant.h"
#import "IGReachability.h"
#import <GoogleOpenSource/GoogleOpenSource.h>
#import <GooglePlus/GooglePlus.h>

@interface IGSocialManager()<GPPSignInDelegate>
{
    NSString *socialNetwork;
    SocialManagerType socialType;
    GTLServicePlus* plusService;
    GPPSignIn *signIn;
}
@property (nonatomic,strong) IGReachability *reachabilityObj;

@property(nonatomic,retain) ACAccountStore *accountStore;
@property(nonatomic,retain)ACAccount *userAccount;
@property(nonatomic,retain) ACAccountType *userAccountType;
@property(nonatomic,weak)  SLComposeViewController *socialSharingSheet;

@end

@implementation IGSocialManager

-(id)initWithType:(SocialManagerType)type
{
    
    self = [super init];
    
    socialType = type;
    
    return self;
}

/*
 * This method will allow the user to login through social account
 */
-(void)socialLogin
{
    self.accountStore = [[ACAccountStore alloc]init];
    self.userAccount=[[ACAccount alloc]init];
    socialNetwork=[[NSString alloc]init];
    
    NSString *fbApplicationkey;
    NSDictionary *optionDictFB;
    
    /*
     * This will check atleast one social account is configured in device
     */
    if([self checkAccountConfiguration]==YES)
    {
        /*
         * Check user want to login through facebook or twitter
         */
        if(socialType==SocialManagerTypeFacebook)
        {
            self.userAccountType= [self.accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierFacebook];
            fbApplicationkey =FbAppId;
            optionDictFB = [NSDictionary dictionaryWithObjectsAndKeys:fbApplicationkey,ACFacebookAppIdKey,@[@"email"],ACFacebookAudienceFriends, nil];
            
        }
        else
        {
            self.userAccountType= [self.accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
            
        }
        /*
         * This will request to access the configured account in device
         */
        [self.accountStore requestAccessToAccountsWithType:self.userAccountType options:optionDictFB completion:
         ^(BOOL granted, NSError *error) {
             if (granted)
             {
                 /*
                  * Get accounts configured in device and put them in array
                  */
                 NSArray *arrayOfAccounts = [self.accountStore accountsWithAccountType:self.userAccountType];
                 /*
                  * From arrayOfAccounts put the last configured account in ACAccount i.e. userAccount
                  */
                 self.userAccount = [arrayOfAccounts lastObject];
                 [self getAccessToken];
                 [self fetchDataFromServer];//:TwitterUrl];
             }
             /*
              * If permission is not granted then display alert message
              */
             else
             {
                 NSString *msg=[NSString stringWithFormat:@"Please check access permission for %@ in settings",socialNetwork ];
                 [self showAlertWithTitle:NSLocalizedString(@"Message", @"") withMessage:NSLocalizedString(msg, @"")];
             }
         }];
    }
    /*
     * Show AlertBox if no account is configured in device
     */
    else{
        NSString *msg=[NSString stringWithFormat:@"Please add your %@ account from settings",socialNetwork ];
        [self showAlertWithTitle:NSLocalizedString(@"Message", @"") withMessage:NSLocalizedString(msg, @"")];
    }
}

/*
 * This method will check atleast one social account is configured in device, if configured return YES else return NO
 */
-(BOOL)checkAccountConfiguration
{
    BOOL check=NO;
    if(socialType==SocialManagerTypeFacebook)
    {
        socialNetwork = @"Facebook";
        if( [SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
        {
            _socialSharingSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
            check= YES;
        }
    }
    if(socialType==SocialManagerTypeTwitter)
    {
        socialNetwork= @"Twitter";
        if( [SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
        {
            _socialSharingSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
            check= YES;
        }
    }
    return check;
}

/*
 * This method will provide the access token for facebook user
 */
-(void)getAccessToken
{
    if(socialType==SocialManagerTypeFacebook)
    {
        ACAccountCredential *facebookCredential = [self.userAccount credential];
        NSString *accessToken = [facebookCredential oauthToken];
        
        NSLog(@"Facebook Access Token: %@", accessToken);
    }
    
}

/*
 * This method will fetch the data from the social account if the permission to access account is granted
 */
-(void)fetchDataFromServer//:(NSString *)str
{
    NSURL *requestURL;
    SLRequest *request;
    NSDictionary *message=RequestParameterDictionary;
    if(socialType==SocialManagerTypeFacebook)
    {
        requestURL = [NSURL URLWithString:FbUrl];
        request = [SLRequest requestForServiceType:SLServiceTypeFacebook
                                     requestMethod:SLRequestMethodGET
                                               URL:requestURL
                                        parameters:message];
    }
    else
    {
        requestURL = [NSURL URLWithString:TwitterUrl];//str];//TwitterUrl];
        request = [SLRequest requestForServiceType:SLServiceTypeTwitter
                                     requestMethod:SLRequestMethodGET
                                               URL:requestURL
                                        parameters:message];
        
        _screenNameTwitter=self.userAccount.username;
        _userIdTwitter=[[self.userAccount valueForKeyPath:@"properties"]objectForKey:@"user_id"];
//        NSLog(@"%@",_screenNameTwitter);
//        NSLog(@"%@",_userIdTwitter);
    }
    
    /*
     *The account object created i.e. userAccount is assigned to the account property of the SLRequest object
     */
    request.account = self.userAccount;
   
    /*
     *The request is sent to the social network via a call to the performRequestWithHandler method of
     *the SLRequest object. The results from the request are passed to the handler code together with an Error object
     *containing information about the reason for any failure.
     */
    [request performRequestWithHandler:^(NSData *data,
                                         NSHTTPURLResponse *response,
                                         NSError *error) {
        NSLog(@"%@",error);
        
        if(!error){
            NSLog(@"HTTP Response Code: %ld",(long)[response statusCode]);
            /*
             *Create a Foundation object from JSON data
             */
            NSDictionary *responseData =[NSJSONSerialization JSONObjectWithData:data
                                                                        options:kNilOptions error:&error];
            NSLog(@"%@",responseData);
           // NSLog(@"%@",error);
            /*
             *Send the fetched data through delegate
             */
            if([_socialLoginDelegate respondsToSelector:@selector(sendResponseData:)] &&[response statusCode]==200)
            {
//                [_socialLoginDelegate sendResponseData:responseData];
            }
            
            if(socialType==SocialManagerTypeFacebook && [response statusCode]==400)
            {
                NSString *code=[[responseData objectForKey:@"error"] objectForKey:@"code"];
                NSString *errorSubCode=[[responseData objectForKey:@"error"] objectForKey:@"error_subcode"];
                /*
                 *Show AlertBox if username or password for facebook is incorrect or changed
                 */
                if([code integerValue]==190 && [errorSubCode integerValue]==460)
                    [self showAlertWithTitle:NSLocalizedString(@"Message", @"") withMessage:NSLocalizedString(@"Password Changed Please Check Account Details",@"")];
                
                /*
                 * If access token expires then call renewCredentials method
                 */
                if([code integerValue]==190 && [errorSubCode integerValue]==463 )
                {
                    [self renewCredentials];
                }
            }
        }
        else
        {
            NSLog(@"HTTP Response Code: %li",(long)[response statusCode]);
            if(socialType==SocialManagerTypeTwitter && [response statusCode]==401)
            {
                /*
                 *Show AlertBox if username or password for twitter is incorrect or changed
                 */
                [self showAlertWithTitle:NSLocalizedString(@"Message", @"") withMessage:NSLocalizedString(@"UserName or Password Changed Please Check Account Details in Settings",@"")];
            }
            NSLog(@"%@",error);
        }
        
    }];
}

/*
 * This will renew the access token for Facebook
 */
-(void)renewCredentials
{
    [_accountStore renewCredentialsForAccount:(ACAccount *)_userAccount completion:^(ACAccountCredentialRenewResult renewResult, NSError *error){
        if(!error)
        {
            switch (renewResult) {
                case ACAccountCredentialRenewResultRenewed:
                  //  [self fetchDataFromServer];
                    break;
                    
                case ACAccountCredentialRenewResultRejected:
                    [self showAlertWithTitle:NSLocalizedString(@"Message", @"") withMessage:NSLocalizedString(@"Please check access permission for Facebook in settings",@"")];
                    break;
                    
                case ACAccountCredentialRenewResultFailed:
                    [self showAlertWithTitle:NSLocalizedString(@"Message", @"") withMessage:NSLocalizedString(@"Facebook server is not responding Please try again",@"")];
                    break;
                default:
                    break;
            }
        }
        else{
            [self showAlertWithTitle:@"Error" withMessage:[error localizedDescription]];
        }
    }];
}

/*
 * This method is being used to share text and image on social network
 */
-(void)socialSharing:(NSString *)text withImageName:(NSString *)imageName andController:(UIViewController *)topController
{
    if([self checkAccountConfiguration]==YES)
    {
        [_socialSharingSheet setInitialText:text];
        [_socialSharingSheet addImage:[UIImage imageNamed:imageName]];
    
        [topController presentViewController:_socialSharingSheet animated:YES completion:Nil];
        
    }
    else{
        NSString *msg=[NSString stringWithFormat:@"Please add your %@ account from settings",socialNetwork ];
        [self showAlertWithTitle:NSLocalizedString(@"Message", @"") withMessage:NSLocalizedString(msg, @"")];
    }
    
}


/*
 * This method is being used to show alert with OK button option.
 */
- (void) showAlertWithTitle:(NSString *)tittle withMessage:(NSString *)message
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:tittle message:message delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", NULL) otherButtonTitles:nil];
    [alertView performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:YES];
}

/*
 * This method is being used to share text and image on Google+
 */
- (void)googleShare :(NSString *)msg andImage:(UIImage *)image
{
    id<GPPNativeShareBuilder> shareBuilder = [[GPPShare sharedInstance] nativeShareDialog];
    // This line will fill out the title, description, and thumbnail from
    // the URL that you are sharing and includes a link to that URL.
    //[shareBuilder setURLToShare:[NSURL URLWithString:@"www.intelligrape.com"]];
    [shareBuilder setPrefillText:msg];
    [shareBuilder attachImage:image];
    bool val=[shareBuilder open];
    
    if(val==YES)
    {
        NSLog(@"%d",val);
    }
    else
    {
        [self showAlertWithTitle:NSLocalizedString(@"Message", @"") withMessage:NSLocalizedString(@"Please Login on Google+ to share post", @"")];
        
    }
    
}

/*
 * This method will allow the user to login through google+
 */
-(void)googlePlusLogin
{
    //[[GPPSignIn sharedInstance] signOut];

    self.reachabilityObj = [IGReachability reachabilityForInternetConnection];
//    if ([self isNetworkConnectionAvailable]) {
    
        
        signIn = [GPPSignIn sharedInstance];
        signIn.delegate = self;
        
        signIn.shouldFetchGooglePlusUser = YES;
        signIn.shouldFetchGoogleUserEmail = YES;
        
        // You previously set kClientId in the "Initialize the Google+ client" step
        signIn.clientID = @"961565929366-1oo5tp9ea1jngr36l9o1qid8g21tn3b3.apps.googleusercontent.com";
        
        // Uncomment one of these two statements for the scope you chose in the previous step
        signIn.scopes = [NSArray arrayWithObject:@"https://www.googleapis.com/auth/plus.login"];
        //@[ kGTLAuthScopePlusLogin ];  // "https://www.googleapis.com/auth/plus.login" scope
        
        
        //[signIn trySilentAuthentication];
        [signIn authenticate];
    
//    else
//    {
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"ERROR" message:@"connect to network" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil  , nil];
//        [alert show];
//    }
}

/*
 * This method will be called after authorization has finished
 */
- (void)didDisconnectWithError:(NSError *)error
{
    
}


- (void)finishedWithAuth: (GTMOAuth2Authentication *)auth
                   error: (NSError *) error {
    NSLog(@"Received error %@ and auth object %@",error, auth);
    if(!error)
    {
        // Get the email address.
        NSLog(@"%@", signIn.authentication.userEmail);
        
        NSString *emailId = signIn.authentication.userEmail;
        
        GTLPlusPerson *user = signIn.googlePlusUser;
        NSString *userName = user.displayName;
        
        _accessTokenGoogle = auth.accessToken;
        NSLog(@"Access token is %@",auth.accessToken);
        _refreshTokenGoogle = auth.refreshToken;
        
        [self.socialLoginDelegate onGooglePlusLoginDoneWithData:emailId withError:nil];

    }
    else
    {
        NSLog(@"%@",error);
        NSLog(@"%ld",(long)[error code]);
        
        [self.socialLoginDelegate onGooglePlusLoginDoneWithData:nil withError:error];

    }
    
}

/*
 * This method will signout the google+ account
 */
-(void)signOutGooglePlus
{
    [[GPPSignIn sharedInstance] signOut];
}

/*
 * This method will initialize google plus instance ansd set authentication
 */
-(void)IntializeGooglePlus
{
    plusService = [[GTLServicePlus alloc] init];
    plusService.retryEnabled = YES;
    
    [plusService setAuthorizer:[GPPSignIn sharedInstance].authentication];
}

/*
 * This method obtain a list of people who the signed-in user has added to one or more circles, which is limited
 * to the circles the user made visible to the requesting app
 */
-(void)fetchPeopleInCircles
{
    [self IntializeGooglePlus];
    //Create a GTLQuery object to list people who are visible to this sample app.
    
    GTLQueryPlus *query =
    [GTLQueryPlus queryForPeopleListWithUserId:@"me"
                                    collection:kGTLPlusCollectionVisible];
    [plusService executeQuery:query
            completionHandler:^(GTLServiceTicket *ticket,
                                GTLPlusPeopleFeed *peopleFeed,
                                NSError *error) {
                
                NSLog(@"%ld",(long)[ticket statusCode]);
                
                if (error) {
                    GTMLoggerError(@"Error: %@", error);
                    NSLog(@"%ld",(long)[error code]);
                    switch ([error code]) {
                        case 401:
                            [self refreshCredentialGoogle];
                            break;
                        case 503:
                            [self showAlertWithTitle:NSLocalizedString(@"Message", @"") withMessage:NSLocalizedString(@"Please Try After Some time\n Server Not Responding", @"")];
                            
                        default:
                            break;
                    }
                }
                else {
                    // Get an array of people from GTLPlusPeopleFeed
                    NSArray* peopleList = peopleFeed.items;
                    NSLog(@"%@",peopleList);
                }
            }];
}

/*
 * This method obtain the profile information of the signed-in user
 */
-(void)fetchProfileInformation
{
    [self IntializeGooglePlus];
    GTLQueryPlus *quer = [GTLQueryPlus queryForPeopleGetWithUserId:@"me"];
    
    [plusService executeQuery:quer
            completionHandler:^(GTLServiceTicket *ticket,
                                GTLPlusPerson *person,
                                NSError *error) {
        
                if (error) {
                    GTMLoggerError(@"Error: %@", error);
                    NSLog(@"%ld",(long)[error code]);
                    switch ([error code]) {
                        case 401:
                             [self refreshCredentialGoogle];
                            break;
                        case 503:
                            [self showAlertWithTitle:NSLocalizedString(@"Message", @"") withMessage:NSLocalizedString(@"Please Try After Some time\n Server Not Responding", @"")];
                            
                        default:
                            break;
                    }
                   
                } else {
                    // Retrieve the display name and "about me" text
                    NSString *description = [NSString stringWithFormat:
                                             @"%@\n%@", person.displayName,person.aboutMe];
                    NSLog(@"%@", signIn.authentication.userEmail);
                    NSLog(@"%@",description);
                }
            }];
    
}

/*
 * This will renew the access token for Google+
 */
-(void)refreshCredentialGoogle
{
    NSString *ClientID=ClientId;
    NSString *ClientSecretKey=ClientSecret;
    NSString *post =[[NSString alloc] initWithFormat:@"client_secret=%@&grant_type=refresh_token&refresh_token=%@&client_id=%@",ClientSecretKey,_refreshTokenGoogle,ClientID];
    NSLog(@"%@",post);
    NSURL *url=[NSURL URLWithString:@"https://accounts.google.com/o/oauth2/token"];
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    
    NSError *error;
    NSURLResponse *response;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
   // NSString *data=[[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
    NSDictionary *dict =[NSJSONSerialization JSONObjectWithData:urlData
                                                                options:kNilOptions error:&error];
    NSLog(@"%@",[dict objectForKey:@"access_token"]);
    _accessTokenGoogle=[dict objectForKey:@"access_token"];
   NSLog(@"%@",dict);
}
//-(BOOL)isNetworkConnectionAvailable
//{
//    NetworkStatus networkStatus = [self.reachabilityObj currentReachabilityStatus];
//    
//    if (networkStatus == NotReachable)
//    {
//        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Event Management" message:@"Network connectivity is required for this application to work" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
//        [alertView show];
//        return NO;
//    }
//    else
//    {
//        return YES;
//    }
//    
//}
-(void)getRequestToken
{
    //socialType=SocialManagerTypeTwitter;
    //[self socialLogin];
    
   // [self fetchDataFromServer:TwitterUrl];
    /*
    oauth_consumer_key%3DJP3PyvG67rXRsnayOJOcQ%26
    oauth_nonce%3D1B7D865D-9E15-4ADD-8165-EF90D7A7D3D2%26
    oauth_signature_method%3DHMAC-SHA1%26
    oauth_timestamp%3D1322697052%26
    oauth_version%3D1.0%26
    x_auth_mode%3Dreverse_auth
    
    oauth_consumer_key	JP3PyvG67rXRsnayOJOcQ
    oauth_nonce	1B7D865D-9E15-4ADD-8165-EF90D7A7D3D2
    oauth_signature_method	HMAC-SHA1
    oauth_timestamp	1322697052
    oauth_version	1.0
    x_auth_mode	reverse_auth;
    */
   /*
    NSString *appKey=@"7C9FBMoMkixIdTEk7qTvcHIgV";
    NSString *appSecret=@"Nug4sl0J9jtIvTvZYnLJhib7iirv2anihCDe6VmjvAkqR3NUUf";
    NSString *outhNonce =@"76016d24bf40541b8bd9ba1829471684";
    
    NSString *oauthSignature=@"P2ovvD9P1Z9j1JDyO6so3xuxRTk%3D";
    NSString *signatureMethod=@"HMAC-SHA1";
    NSString *version=@"1.0";
    NSString *mode=@"reverse_auth";
    NSString *timestamp = @"1409141334";//[NSString stringWithFormat:@"%f",[[NSDate date] timeIntervalSince1970]];
    oauth_callback
    
    NSString *twitterUrlToPing = @"https://api.twitter.com/oauth/request_token";
    
    NSURL *twitterUrl = [NSURL URLWithString:twitterUrlToPing];
    
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:twitterUrl];
    [req addValue:appKey forHTTPHeaderField:@"oauth_consumer_key"];
    [req addValue:outhNonce forHTTPHeaderField:@"oauth_nonce"];
    [req addValue:signatureMethod forHTTPHeaderField:@"oauth_signature_method"];
    [req addValue:timestamp forHTTPHeaderField:@"oauth_timestamp"];
    [req addValue:version forHTTPHeaderField:@"oauth_version"];
    [req addValue:mode forHTTPHeaderField:@"x_auth_mode"];
    
    [req setHTTPMethod:@"POST"];
    
    NSLog(@"twitterHeaderPostvalues: %@", [req allHTTPHeaderFields]);
    
    NSURLResponse *response;
    NSError *err;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:req returningResponse:&response error:&err];
    NSString *content = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    NSLog(@"contentResponseFromTwitter: %@", content);
    */
    
    
   /* NSString *post =[[NSString alloc] initWithFormat:@"oauth_consumer_key=%@,oauth_nonce=%@,oauth_signature=%@,oauth_signature_method=%@,oauth_timestamp=%@,oauth_version=%@,x_auth_mode=%@",appKey,outhNonce,oauthSignature,signatureMethod,timestamp,version,mode];
    
    
    NSLog(@"%@",post);
    NSURL *url=[NSURL URLWithString:@"https://api.twitter.com/oauth/request_token"];
    
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    
    //NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:postData];
    
    
    NSError *error;
    NSURLResponse *response;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
     NSString *data=[[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@",data);*/
}
@end
