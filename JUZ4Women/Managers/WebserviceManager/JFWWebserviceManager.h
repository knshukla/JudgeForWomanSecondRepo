//
//  WebserviceManager.h
//  MediaFoundryMobileApp
//
//  Created by Kailash on 4/18/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JFWAppConstants.h"

@class MFMediaModal;
@class JFWLoginModel;
@class JFWLeftMenuModel;
@class UserModel;
@class JFWFeedsModel;
@class VideoModel;
@class ArticleModel;

typedef void (^SuccessBlock)(id);
typedef void (^FailureBlock)(NSError *);

@interface JFWWebserviceManager : NSObject

-(void)requestLoginApiWithLoginModal:(UserModel *)loginModel withSuccessBlock:(void (^)(id))successBlock withFailureBlock:(void (^) (NSError *))failureBlock;

-(void)requestSignUpApiWithUserModal:(UserModel *)userModel withSuccessBlock:(void (^)(id))successBlock withFailureBlock:(void (^) (NSError *))failureBlock;

-(void)requestLeftMenuApiWithLeftMenuModel:(UserModel *)userModel withSuccessBlock:(void (^)(id))successBlock withFailureBlock:(void (^) (NSError *))failureBlock;

-(void)requestFeedApiWithFeedModel:(JFWFeedsModel *)feedModel withSuccessBlock:(void (^)(id))successBlock withFailureBlock:(void (^) (NSError *))failureBlock;

-(void)requestAddFeedApiWithFeedModel:(JFWFeedsModel *)feedModel withSuccessBlock:(void (^)(id))successBlock withFailureBlock:(void (^) (NSError *))failureBlock;

-(void)requestVideoFeedApiWithVideoModel:(VideoModel *)videoModel withSuccessBlock:(void (^)(id))successBlock withFailureBlock:(void (^) (NSError *))failureBlock;

-(void)requestArticleFeedApiWithArticleModel:(ArticleModel *)articleModel withSuccessBlock:(void (^)(id))successBlock withFailureBlock:(void (^) (NSError *))failureBlock;

-(void)requestForgotPasswordApiWithPassword:(NSString *)password withSuccessBlock:(void (^)(id))successBlock withFailureBlock:(void (^) (NSError *))failureBlock;

-(void)requestLegalAdviceApiWithArticleModel:(ArticleModel *)articleModel withSuccessBlock:(void (^)(id))successBlock withFailureBlock:(void (^) (NSError *))failureBlock;

-(void)requestUserProfileApiWithUserModal:(UserModel *)userModel withSuccessBlock:(void (^)(id))successBlock withFailureBlock:(void (^) (NSError *))failureBlock;

-(void)requestVideoLikeApiWithVideoModal:(VideoModel *)videoModelObj inspiredValue:(LikeInspiredValue)inspiredValue withSuccessBlock:(void (^)(id))successBlock withFailureBlock:(void (^) (NSError *))failureBlock;

@property (copy, nonatomic) SuccessBlock successBlock;
@property (copy, nonatomic) FailureBlock failureBlock;

@end

