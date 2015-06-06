//
//  WebserviceManager.m
//  MediaFoundryMobileApp
//
//  Created by Kailash on 4/18/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "MFWebserviceManager.h"
#import "MFLibraryConstants.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"

//#import "MFErrorHandler.h"
//#import "MFMedia.h"
//#import "MFLiveEventModal.h"
//#import "MFVideoModal.h"
//#import "MFMediaModal.h"

@interface MFWebserviceManager()

@property (strong, nonatomic) AFHTTPRequestOperationManager *networkManager;

@end

@implementation MFWebserviceManager


- (id)init
{
    if((self = [super init])) {
        self.networkManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseUrl]];
        return self;
    }
    return nil;
}

- (AFHTTPRequestOperation *)getApiData:(NSString *)URLString
                            parameters:(id)parameters
                               success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                               failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    AFHTTPRequestOperation *operation = [self.networkManager GET:URLString parameters:parameters success: success failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //NSError *customizeError = [MFErrorHandler errorWithCode:error.code];
        failure(operation,error);
    }];
    return operation;
}


- (AFHTTPRequestOperation *)postApiData:(NSString *)URLString
                             parameters:(id)parameters
                                success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                                failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    AFHTTPRequestOperation *operation = [self.networkManager POST:URLString parameters:parameters success: success failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //NSError *customizeError = [MFErrorHandler errorWithCode:error.code];
        failure(operation,error);
    }];
    return operation;
}



- (void)requestMediaListData:(NSString *)mediaApiString WithSuccessBlock:(void (^)(MFMediaModal *mediaArray))successBlock WithFailureBlock:(void (^)(NSError *error))failureBlock
{
    //NSString *apiString = @"api/listVideo?items_per_page=4&page=0";
     NSString *urlString = [NSString stringWithFormat:@"%@%@",kBaseUrl,mediaApiString];
    
    self.successBlock = successBlock;
    self.failureBlock = failureBlock;
    
    [self getApiData:mediaApiString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //API successful
        [self handleReceviedResponse:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //API failed
        self.failureBlock(error);
    }];

}

- (void)handleReceviedResponse:(NSDictionary *)responseDictionary
{
    //[self parseVideoList:responseDictionary];
}

//- (void)parseVideoList:(NSDictionary *)responseDictionary
//{
//    NSMutableArray *videoItemArray = [[NSMutableArray alloc] initWithCapacity:0];
//    NSMutableArray *eventItemArray = [[NSMutableArray alloc] initWithCapacity:0];
//
//    NSMutableArray *videoListArray = [responseDictionary valueForKey:@"videos"];
//    NSMutableDictionary *liveEventDictionary = [responseDictionary valueForKey:@"live_event"];
//    
//    NSDictionary *imagesDictionary = [responseDictionary valueForKey:@"promo_images"];
//    NSDictionary *sponsorImageDictionary;
//    NSDictionary *eventImageDictionary;
//    
//    NSArray *imageDictionaryKeysArray = imagesDictionary.allKeys;
//    if([imageDictionaryKeysArray containsObject:@"Sponsor"])
//    {
//        
//        if ([imagesDictionary valueForKey:@"Sponsor"])
//        {
//            sponsorImageDictionary = [imagesDictionary valueForKey:@"Sponsor"];
//        }
//    }
//    
//    if([imageDictionaryKeysArray containsObject:@"Event"])
//    {
//        
//        if([imagesDictionary valueForKey:@"Event"])
//        {
//            eventImageDictionary = [imagesDictionary valueForKey:@"Event"];
//        }
//    }
//
//
//    for (NSDictionary *videoModalDict in videoListArray)
//    {
//        MFVideoModal *videoModalObj = [[MFVideoModal alloc] init];
//        
//        [videoModalObj createVideoModalWithDictionary:videoModalDict];
//        [videoItemArray addObject:videoModalObj];
//    }
//    
//    MFLiveEventModal *liveEventModalObj = [[MFLiveEventModal alloc] init];
//    
//    [liveEventModalObj createEventModalWithDictionary:liveEventDictionary];
//    [eventItemArray addObject:liveEventModalObj];
//    NSString *eventThumbnail;
//    NSString *sponsorThumbnail;
//    if([eventImageDictionary valueForKey:@"thumbnail"])
//    {
//        if([[eventImageDictionary valueForKey:@"thumbnail"] isEqualToString:@""] ||[[eventImageDictionary valueForKey:@"thumbnail"] isEqualToString:@" "])
//        {
//            eventThumbnail = nil;
//        }
//        else
//        {
//            eventThumbnail = [eventImageDictionary valueForKey:@"thumbnail"];
//        }
//       
//    }
//    if([sponsorImageDictionary valueForKey:@"thumbnail"])
//    {
//        if([[sponsorImageDictionary valueForKey:@"thumbnail"] isEqualToString:@""] || [[sponsorImageDictionary valueForKey:@"thumbnail"] isEqualToString:@""])
//        {
//            sponsorThumbnail =nil ;
//        }
//        else
//        {
//            sponsorThumbnail =[sponsorImageDictionary valueForKey:@"thumbnail"] ;
//        }
//        
//    }
//    
//    
//    MFMediaModal *mediaModalObj = [[MFMediaModal alloc]initWithEventModalArray:eventItemArray withVideoModalArray:videoItemArray withsponsorThumbnailUrl:sponsorThumbnail witheventThumbnailUrl:eventThumbnail];
//    
//    self.successBlock(mediaModalObj);
//    
//}
//

-(void)requestLoginApiWithLoginModal:(JFWLoginModel *)loginModal withSuccessBlock:(void (^)(id modal))successBlock withFailureBlock:(void (^) (NSError *error))failureBlock
{
    self.successBlock = successBlock;
    self.failureBlock = failureBlock;
    
    NSMutableDictionary *dataDict = [[NSMutableDictionary alloc]init];
    
    [dataDict setObject:@"loginAuthentication" forKey:@"requestType"];
    [dataDict setObject:@"vivekbansal" forKey:@"username"];
    [dataDict setObject:@"vivek123" forKey:@"password"];
    
    NSError *error =nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dataDict
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    
    if (! jsonData)
    {
        NSLog(@"Got an error: %@", error);
    }
    else
    {
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        
        [self postApiData:kBaseUrl parameters:jsonString success:^(AFHTTPRequestOperation *operation, id responseObject) {
            //API successful
            [self handleReceviedResponse:responseObject];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            //API failed
            self.failureBlock(error);
        }];
    }

    
}

@end
