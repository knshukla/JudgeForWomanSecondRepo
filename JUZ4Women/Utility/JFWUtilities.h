//
//  MFUtilities.h
//  MediaFoundryMobileAppLibrary
//
//  Created by Cybage on 08/08/14.
//  Copyright (c) 2014 Hostworks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/** This is Utilities class that contains common Utilities required throughout project
 */
@interface JFWUtilities : NSObject

/** This method will creates Alert view to pop up message
 
 @param title. Title for alert view
 @param message. Message to display on alert
 @param cancelButtonTitle. cancel button's title
 @param otherButtonTitleArray. other button's title array if any
 @param delegate: Respond to requesting object
 
 @return void nothing it returns.
 */
+ (void)displayAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle delegate:(id)delegate withTag:(NSInteger)tag;

/** This method will add underline attribute to the parameter string
 
 @param normalString Norma string object
 @return NSMutableAttributedString Object of attributed string with underline attribute added.
 */
+ (NSMutableAttributedString *)readHyperlinkedAttributtedStringForString:(NSString *)normalString;

/** This method will resize dynamically based on its text length and font style/size.
 
 @param oldLabel Old label object
 @return void nothing it returns.
 */
+ (void)resizeLabel:(UILabel *)oldLabel;

/** This method will Converts epochTime to NSDate
 
 @param epochTime EpochTime in string
 @return Returns converted Date.
 */
+ (NSDate *)epochTimeToNSDate:(NSString *)epochTime;

/** This method will convert and returns specified date to specified format
 
 @param formatter Old Date format
 @param formatter New Date format
 @param dateString Date to be formatted
 @return Returns formatted date.
 */
+ (NSString *)readDateWithFormatter:(NSString *)oldFormatter withNewFormatter:(NSString *)newFormatter withDate:(NSString *)dateString;

/** This method will retrieve list API base string w.r.t. media type
 
 @param mediaType Media Type for which API string is required.
 @return NSString API string
 */

/** This method will retrieve Search media list API base string w.r.t. media type
 
 @param mediaType Search Media Type for which API string is required.
 @return NSString API string
 */


/** This method will retrieve Category media list API base string w.r.t. media type
 
 @param mediaType Media Type for which API string is required.
 @param allCategory Bool to indicate request is for all cateories or not.
 @return NSString Category media list API string
 */

/** This method will retrieve Error message w.r.t. errorCode
 
 @param mediaType Media Type for which API string is required.
 @param allCategory Bool to indicate request is for all cateories or not.
 @return NSString Category media list API string
 */

/** This method will check string contains only white spaces or not
 
 @param string A string which needs to validate for white spaces.
 @return BOOL Returns YES if string contains only white spaces, else returns NO.
 */
+ (BOOL)checkStringContainsOnlySpace:(NSString *)string;

/** This method will check Network is Reachable or not
 
 @return BOOL Returns YES if Network is Reachable, else returns NO.
 */
+ (BOOL )readNetworkReachability;

/** This method will be used to set exclusive touch property as a TRUE/YES to all subviews.
 
 @param subView Sub view object
 @return void nothing it returns.
 */
+ (void) setExclusiveTouchForAllSubViews:(UIView *)subView;

+(BOOL)getBoolFromUserDefaultForkey:(NSString *)key;

+(BOOL)isOSVersionIsAtLeastiOS7;

+(BOOL)validateEmailWithString:(NSString*)email;

+(BOOL)validatePhoneNumberString:(NSString*)numberString;

+(void)setPlaceHolderTextColor:(UITextField *)textField color:(UIColor *)color;
+(UIColor *)placeHolderTextColor;

+ (NSString *)encodeToBase64String:(UIImage *)image;
+ (UIImage *)decodeBase64ToImage:(NSString *)strEncodeData;
+ (NSInteger)daysBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime;

+(void)showAlert:(NSString *)message;

@end
