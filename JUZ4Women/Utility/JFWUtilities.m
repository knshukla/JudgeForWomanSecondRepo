//
//  MFUtilities.m
//  MediaFoundryMobileAppLibrary
//
//  Created by Cybage on 08/08/14.
//  Copyright (c) 2014 Hostworks. All rights reserved.
//

#import "JFWUtilities.h"
#import <CoreText/CoreText.h>

static BOOL OSVersionIsAtLeastiOS7() {
    return (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1);
}

@implementation JFWUtilities

+ (void)displayAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle delegate:(id)delegate withTag:(NSInteger)tag
{
//    dispatch_async(dispatch_get_main_queue(),^{
        UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitle, nil];
        alerView.tag = tag;
        [alerView show];
//    });
}

+ (NSMutableAttributedString *)readHyperlinkedAttributtedStringForString:(NSString *)normalString
{
    //Add Hyperlink for normal string
    NSRange range = NSMakeRange(0, normalString.length);
    NSMutableAttributedString *hyperlinkedAttributedString = [[NSMutableAttributedString alloc] initWithString:normalString];
    [hyperlinkedAttributedString addAttribute:(NSString *)kCTUnderlineStyleAttributeName value:[NSNumber numberWithInt:kCTUnderlineStyleSingle] range:range];
    return hyperlinkedAttributedString;
}

+ (void)resizeLabel:(UILabel *)oldLabel
{
    oldLabel.numberOfLines = 0;
    oldLabel.lineBreakMode = NSLineBreakByWordWrapping;
    CGRect frame = oldLabel.frame;
    frame.size.width = oldLabel.frame.size.width;
    frame.size = [oldLabel sizeThatFits:frame.size];
    oldLabel.frame = frame;
    
    CGFloat height = oldLabel.font.leading;
    NSInteger numberOfRow = floor(frame.size.height/height);
    oldLabel.numberOfLines = numberOfRow;
}

+ (NSDate *)epochTimeToNSDate:(NSString *)epochTime
{
    return [NSDate dateWithTimeIntervalSince1970:epochTime.doubleValue];;
}

+ (NSString *)readDateWithFormatter:(NSString *)oldFormatter withNewFormatter:(NSString *)newFormatter withDate:(NSString *)dateString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:oldFormatter];
    NSDate *date = [dateFormatter dateFromString:dateString];
    [dateFormatter setDateFormat:newFormatter];
    NSString *newDateString = [dateFormatter stringFromDate:date];
    return newDateString;
}



+ (BOOL)checkStringContainsOnlySpace:(NSString *)string
{
    NSCharacterSet *set = [NSCharacterSet whitespaceCharacterSet];
    if ([[string stringByTrimmingCharactersInSet: set] length] == 0)
    {
        // String contains only white spaces.
        return YES;
    }
    return NO;
}



#pragma mark Set Buttons Exclusive Touch Yes
+ (void) setExclusiveTouchForAllSubViews:(UIView *)subView
{
    if (!subView) return;
    
    for (UIView * view in [subView subviews]) {
        [view setExclusiveTouch:YES];
        if ([[view subviews] count] > 0){
            [JFWUtilities setExclusiveTouchForAllSubViews:view];
        }
    }
}

+(BOOL)getBoolFromUserDefaultForkey:(NSString *)key
{
    if(!key || key.length == 0)
        return NO;
    
    BOOL result = [[NSUserDefaults standardUserDefaults]boolForKey:key];
    
    return result;
}

+(BOOL)isOSVersionIsAtLeastiOS7
{
    return OSVersionIsAtLeastiOS7();
}

+(BOOL)validateEmailWithString:(NSString*)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+(BOOL)validatePhoneNumberString:(NSString*)numberString
{
    NSString *phoneRegex = @"^((\\+)|(00))[0-9]{6,14}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:numberString];
}

+(void)setPlaceHolderTextColor:(UITextField *)textField color:(UIColor *)color
{
    if (!textField.placeholder)
        return;
    
    if ([textField respondsToSelector:@selector(setAttributedPlaceholder:)]) {
        textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:textField.placeholder attributes:@{NSForegroundColorAttributeName: color}];
    } else {
        NSLog(@"Cannot set placeholder text's color, because deployment target is earlier than iOS 6.0");
        // TODO: Add fall-back code to set placeholder color.
    }
}

+ (NSString *)encodeToBase64String:(UIImage *)image
{
    return [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}

+ (UIImage *)decodeBase64ToImage:(NSString *)strEncodeData
{
    NSData *data = [[NSData alloc]initWithBase64EncodedString:strEncodeData options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [UIImage imageWithData:data];
}

+(UIColor *)placeHolderTextColor
{
    return [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:.6];
}

+ (NSInteger)daysBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime
{
    NSDate *fromDate;
    NSDate *toDate;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&fromDate
                 interval:NULL forDate:fromDateTime];
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&toDate
                 interval:NULL forDate:toDateTime];
    
    NSDateComponents *difference = [calendar components:NSCalendarUnitDay
                                               fromDate:fromDate toDate:toDate options:0];
    
    return [difference day];
}

+(void)showAlert:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    
    [alert show];
}

+(NSDate *)getDateFromDate:(NSString *)dateString andTime:(NSString *)timeString
{
    if (!dateString || !timeString) {
        return nil;
    }
    
    NSString *completeString = [NSString stringWithFormat:@"%@ %@",dateString, timeString];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:[NSTimeZone localTimeZone].secondsFromGMT]];
    
    NSDate *date = [dateFormatter dateFromString:completeString];
    
    return date;
    
}


+ (NSString *)relativeDateStringForDate:(NSDate *)date
{
    NSCalendarUnit units = NSDayCalendarUnit | NSWeekOfYearCalendarUnit |
    NSMonthCalendarUnit | NSYearCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit;
    
    // if `date` is before "now" (i.e. in the past) then the components will be positive
    NSDateComponents *components = [[NSCalendar currentCalendar] components:units
                                                                   fromDate:date
                                                                     toDate:[NSDate date]
                                                                    options:0];
    
    if (components.year > 0)
    {
        return [NSString stringWithFormat:@"%ld years ago", (long)components.year];
    }
    else if (components.month > 0) {
        return [NSString stringWithFormat:@"%ld months ago", (long)components.month];
    }
    else if (components.weekOfYear > 0) {
        return [NSString stringWithFormat:@"%ld weeks ago", (long)components.weekOfYear];
    }
    else if (components.day > 0)
    {
        if (components.day > 1)
        {
            return [NSString stringWithFormat:@"%ld days ago", (long)components.day];
        }
        else
        {
            return @"Yesterday";
        }
    }
    else
    {
        if (components.hour > 0)
        {
            return [NSString stringWithFormat:@"%ld hrs ago", components.hour];
        }
        else if (components.minute > 0)
        {
            return [NSString stringWithFormat:@"%ld mins ago", components.minute];
        }
        else
            return @"just now";
    }
}
@end
