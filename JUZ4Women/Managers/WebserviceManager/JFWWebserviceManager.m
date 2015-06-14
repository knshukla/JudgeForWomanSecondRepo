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
#import "UserModel.h"
#import "JFWFeedsModel.h"

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

    UserModel *userModel = [parserManager parseLoginResponseWith:responseDictionary];
    
    self.successBlock(userModel);
}

-(void)requestLoginApiWithLoginModal:(UserModel *)userModel withSuccessBlock:(void (^)(id modal))successBlock withFailureBlock:(void (^) (NSError *error))failureBlock
{
    self.successBlock = successBlock;
    self.failureBlock = failureBlock;
    
    JFWRequestDictionaryGenerator *requestGeneratorManager = [[JFWRequestDictionaryGenerator alloc]init];
    
    NSMutableDictionary *dataDict = [requestGeneratorManager createLoginRequestDictionary:userModel];
    
        
        [self postApiData:kBaseUrl parameters:dataDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
            //API successful
            [self handleReceviedResponse:responseObject];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            //API failed
            self.failureBlock(error);
        }];

    
}

-(void)requestLeftMenuApiWithLeftMenuModel:(UserModel *)userModel withSuccessBlock:(void (^)(id))successBlock withFailureBlock:(void (^) (NSError *))failureBlock
{
    JFWRequestDictionaryGenerator *requestGeneratorManager = [[JFWRequestDictionaryGenerator alloc]init];

    self.successBlock = successBlock;
    self.failureBlock = failureBlock;
    
    NSMutableDictionary *dataDict = [requestGeneratorManager createLeftMenuRequestDictionary:userModel];;
    
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


-(void)requestSignUpApiWithUserModal:(UserModel *)userModel withSuccessBlock:(void (^)(id))successBlock withFailureBlock:(void (^) (NSError *))failureBlock
{
    JFWRequestDictionaryGenerator *requestGeneratorManager = [[JFWRequestDictionaryGenerator alloc]init];
    
    self.successBlock = successBlock;
    self.failureBlock = failureBlock;
    
    NSMutableDictionary *dataDict = [requestGeneratorManager getSignUpRequestParameter:userModel];;
    
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
    JFWParserManager *parserManager = [[JFWParserManager alloc]init];
   UserModel *userModel = [parserManager parseLeftMenuResponseWith:responseDictionary];
    self.successBlock(userModel);
    NSLog(@"Response dict is %@",responseDictionary);
}

-(void)requestFeedApiWithFeedModel:(JFWFeedsModel *)feedModel withSuccessBlock:(void (^)(id))successBlock withFailureBlock:(void (^) (NSError *))failureBlock;
{
    JFWRequestDictionaryGenerator *requestGeneratorManager = [[JFWRequestDictionaryGenerator alloc]init];
    
    self.successBlock = successBlock;
    self.failureBlock = failureBlock;
    NSMutableDictionary *dataDict = [requestGeneratorManager createFeedRequestDictionary:feedModel];

    
    [self postApiData:kBaseUrl parameters:dataDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //API successful
        NSLog(@"Successful response");
        [self handleFeedsResponse:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //API failed
        NSLog(@"Failure response");
        
        self.failureBlock(error);
    }];
}

- (void)handleFeedsResponse:(NSDictionary *)responseDictionary
{
    JFWParserManager *parserManager = [[JFWParserManager alloc]init];

    NSMutableArray *dataArray = [parserManager parseFeedsResponseWith:responseDictionary];
    self.successBlock(dataArray);
    
    
}

-(void)requestAddFeedApiWithFeedModel:(JFWFeedsModel *)feedModel withSuccessBlock:(void (^)(id))successBlock withFailureBlock:(void (^) (NSError *))failureBlock
{
    JFWRequestDictionaryGenerator *requestGeneratorManager = [[JFWRequestDictionaryGenerator alloc]init];
    
    self.successBlock = successBlock;
    self.failureBlock = failureBlock;
    NSMutableDictionary *dataDict = [requestGeneratorManager createAddFeedRequestDictionary:feedModel];
    
    
    [self postApiData:kBaseUrl parameters:dataDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //API successful
        NSLog(@"Successful response");
        [self handleAddFeedsResponse:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //API failed
        NSLog(@"Failure response");
        
        self.failureBlock(error);
    }];

}

- (void)handleAddFeedsResponse:(NSDictionary *)responseDictionary
{
    JFWParserManager *parserManager = [[JFWParserManager alloc]init];
    
//    NSMutableArray *dataArray = [parserManager parseFeedsResponseWith:responseDictionary];
//    self.successBlock(dataArray);
    
    
}
@end
