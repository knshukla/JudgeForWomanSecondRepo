//
//  WebserviceManager.h
//  MediaFoundryMobileApp
//
//  Created by Kailash on 4/18/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MFMediaModal;
@class JFWLoginModel;
@class JFWLeftMenuModel;
@class UserModel;
@class JFWFeedsModel;

typedef void (^SuccessBlock)(id);
typedef void (^FailureBlock)(NSError *);

@interface JFWWebserviceManager : NSObject

//- (void)requestMediaListData:(NSString *)mediaApiString WithSuccessBlock:(void (^)(MFMediaModal *mediaArray))successBlock WithFailureBlock:(void (^)(NSError *error))failureBlock;

-(void)requestLoginApiWithLoginModal:(UserModel *)loginModel withSuccessBlock:(void (^)(id))successBlock withFailureBlock:(void (^) (NSError *))failureBlock;

-(void)requestSignUpApiWithLoginModal:(JFWLoginModel *)loginModal withSuccessBlock:(void (^)(id))successBlock withFailureBlock:(void (^) (NSError *))failureBlock;

-(void)requestLeftMenuApiWithLeftMenuModel:(UserModel *)userModel withSuccessBlock:(void (^)(id))successBlock withFailureBlock:(void (^) (NSError *))failureBlock;

-(void)requestFeedApiWithFeedModel:(JFWFeedsModel *)feedModel withSuccessBlock:(void (^)(id))successBlock withFailureBlock:(void (^) (NSError *))failureBlock;

@property (copy, nonatomic) SuccessBlock successBlock;
@property (copy, nonatomic) FailureBlock failureBlock;

@end

