//
//  RequestDictionaryGenerator.h
//  JUZ4Women
//
//  Created by Kailash on 6/14/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JFWLoginModel;
@class JFWLeftMenuModel;
@class UserModel;
@class JFWFeedsModel;
@class VideoModel;
@class ArticleModel;

@interface JFWRequestDictionaryGenerator : NSObject

-(NSMutableDictionary *)createLoginRequestDictionary:(UserModel *)userModel;

-(NSMutableDictionary *)createLeftMenuRequestDictionary:(UserModel *)userModel;

-(NSMutableDictionary *)createFeedRequestDictionary:(JFWFeedsModel *)feedModel;

-(NSMutableDictionary *)getSignUpRequestParameter:(UserModel *)userModel;
-(NSMutableDictionary *)createAddFeedRequestDictionary:(JFWFeedsModel *)feedModel;
-(NSMutableDictionary *)createVideoFeedRequestDictionary:(VideoModel *)videoModel;
-(NSMutableDictionary *)createArticleFeedRequestDictionary:(ArticleModel *)articleModel;

-(NSMutableDictionary *)createForgotPasswordRequestDictionary:(NSString *)password;
-(NSMutableDictionary *)createLegalAdviceFeedRequestDictionary:(ArticleModel *)articleModel;
-(NSMutableDictionary *)createUserProfileRequestDictionary:(UserModel *)userModel;


@end
