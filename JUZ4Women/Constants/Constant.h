//
//  ConstantUrls.h
//  Twitter Login
//
//  Created by Kailash on 01/08/14.
//  Copyright (c) 2014 Kailash. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    kPostLoginService,
    kPostCheckStatusService,
    kPostMarkAttandenceService,
    kGetBirthdayAnniversaryService
    
}RequestType;

/*
 * Twitter api used to fetch data
 */

//#define kLoginUrl @"http://hrms.qa4.intelligrape.net/appUserRegister/register"
//
//#define kAttendanceStatusUrl @"http://hrms.qa4.intelligrape.net/appUserRegister/checkStatus"
//
//#define kMarkAttendanceUrl @"http://hrms.qa4.intelligrape.net/appUserRegister/markPresent"

//#define kLoginUrl @"http://10.1.0.101:8080/hrms/appUserRegister/register"
//
//#define kAttendanceStatusUrl @"http://10.1.0.101:8080/hrms/appUserRegister/checkStatus"
//
//#define kMarkAttendanceUrl @"http://10.1.0.101:8080/hrms/appUserRegister/markAttendance"



//QA URLS

#define kLoginUrl @"http://hrms.qa3.intelligrape.net/appUserRegister/register"

#define kAttendanceStatusUrl @"http://hrms.qa3.intelligrape.net/appUserRegister/checkStatus"

#define kMarkAttendanceUrl @"http://hrms.qa3.intelligrape.net/appUserRegister/markAttendance"

#define TwitterUrl @"https://api.twitter.com/1.1/statuses/user_timeline.json"

//#define kLoginUrl @"http://10.1.12.252:8080/hrms/appUserRegister/register"
//
//#define kAttendanceStatusUrl @"http://10.1.12.252:8080/hrms/appUserRegister/checkStatus"
//
//#define kMarkAttendanceUrl @"http://10.1.12.252:8080/hrms/appUserRegister/markAttendance"
#define kGetBdayAnniversaryUrl @"http://10.1.21.153:8080/hrms/appUserRegister/fetchBirthDayAndAnniversary"

//http://localhost:8080/hrms/appUserRegister/fetchBirthDayAndAnniversary

/*
 * Facebook Application ID
 */
#define FbAppId @"1462248320694162";

/*
 * Facebook api used to fetch friendlists
 */
#define FbUrl @"https://graph.facebook.com/me/friendlists"

/*
 * Parameter passed in SLRequest object
 */
#define RequestParameterDictionary @{}


/*
 * Gmail Client ID
 */
#define kClientId @"961565929366-1oo5tp9ea1jngr36l9o1qid8g21tn3b3.apps.googleusercontent.com"
//#define ClientId @"519289501856-nchgb17io050cf3ol8htubevpc2senlb.apps.googleusercontent.com";
//
///*
// * Google+ App Client Secret
// */
//#define ClientSecret @"8J9TFZKmhfK7Pt0ggvny24Mu";

#define ClientId @"794738559781-ta6febkediapi3h2kragf0r70cui7llq.apps.googleusercontent.com";
//#define ClientId @"419060592954-fhkh8ok40kp4o5njm83r58dorf44ofor.apps.googleusercontent.com";

/*
 * Google+ App Client Secret
 */
#define ClientSecret @"BYW36P6zw8HYOJT6rz7ASkdp";

#define shephertz public and private keys

