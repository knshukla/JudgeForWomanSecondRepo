//
//  WebserviceManager.m
//  MediaFoundryMobileApp
//
//  Created by Kailash on 4/18/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "JFWWebserviceManager.h"
#import "MFLibraryConstants.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "JFWLoginModel.h"
#import "JFWAppConstants.h"
#import "JFWRequestDictionaryGenerator.h"
#import "JFWParserManager.h"

@interface JFWWebserviceManager()

@property (strong, nonatomic) AFHTTPRequestOperationManager *networkManager;

@end

@implementation JFWWebserviceManager


- (id)init
{
    if((self = [super init])) {
        self.networkManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseUrl]];
        self.networkManager.requestSerializer = [AFJSONRequestSerializer serializer];
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
        failure(operation,error);
    }];
    return operation;
}

- (void)handleReceviedResponse:(NSDictionary *)responseDictionary
{
    JFWParserManager *parserManager = [[JFWParserManager alloc]init];
    
    [[NSUserDefaults standardUserDefaults]setObject:[responseDictionary objectForKey:kUid] forKey:kUid];
    
    [[NSUserDefaults standardUserDefaults]setObject:[responseDictionary objectForKey:kUserName] forKey:kUserName];

    JFWLoginModel *loginModel = [parserManager parseLoginResponseWith:responseDictionary];
    
    self.successBlock(loginModel);
}

-(void)requestLoginApiWithLoginModal:(JFWLoginModel *)loginModal withSuccessBlock:(void (^)(id modal))successBlock withFailureBlock:(void (^) (NSError *error))failureBlock
{
    self.successBlock = successBlock;
    self.failureBlock = failureBlock;
    
    JFWRequestDictionaryGenerator *requestGeneratorManager = [[JFWRequestDictionaryGenerator alloc]init];
    
    NSMutableDictionary *dataDict = [requestGeneratorManager createLoginRequestDictionary:loginModal];
    
        
        [self postApiData:kBaseUrl parameters:dataDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
            //API successful
            [self handleReceviedResponse:responseObject];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            //API failed
            self.failureBlock(error);
        }];

    
}

-(void)requestLeftMenuApiWithLeftMenuModel:(JFWLeftMenuModel *)leftMenuModel withSuccessBlock:(void (^)(id))successBlock withFailureBlock:(void (^) (NSError *))failureBlock
{
    self.successBlock = successBlock;
    self.failureBlock = failureBlock;
    
    NSMutableDictionary *dataDict = [[NSMutableDictionary alloc]init];
    NSString *uid = [[NSUserDefaults standardUserDefaults]objectForKey:kUid];
    NSString *userName = [[NSUserDefaults standardUserDefaults]objectForKey:kUserName];

    
    [dataDict setObject:@"getUserDetailsForMenu" forKey:kRequestType];
    [dataDict setObject:userName forKey:kUserName];
    [dataDict setObject:uid forKey:kUid];
    
    NSLog(@"Request dict is %@",dataDict);

    [self postApiData:kBaseUrl parameters:dataDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //API successful
        NSLog(@"Successful response");
        [self handleLeftMenuResponse:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //API failed
        NSLog(@"Failure response");

        self.failureBlock(error);
    }];

}
- (void)handleLeftMenuResponse:(NSDictionary *)responseDictionary
{
    NSLog(@"Response dict is %@",responseDictionary);
}

@end
