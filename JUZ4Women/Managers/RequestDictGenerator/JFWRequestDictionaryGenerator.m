//
//  RequestDictionaryGenerator.m
//  JUZ4Women
//
//  Created by Kailash on 6/14/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "JFWRequestDictionaryGenerator.h"
#import "JFWAppConstants.h"
#import "JFWLoginModel.h"
#import "UserModel.h"
#import "JFWFeedsModel.h"
@implementation JFWRequestDictionaryGenerator

-(NSMutableDictionary *)createLoginRequestDictionary:(UserModel *)userModel
{
    NSMutableDictionary *dataDict = [[NSMutableDictionary alloc]init];
    
    [dataDict setObject:@"loginAuthentication" forKey:kRequestType];
    [dataDict setObject:@"vivekbansal" forKey:kUserName];
    [dataDict setObject:@"vivek123" forKey:kPassword];
    
    return dataDict;
}

-(NSMutableDictionary *)createLeftMenuRequestDictionary:(UserModel *)userModel
{
    NSMutableDictionary *dataDict = [[NSMutableDictionary alloc]init];
    NSString *uid = [[NSUserDefaults standardUserDefaults]objectForKey:kUid];
    NSString *userName = [[NSUserDefaults standardUserDefaults]objectForKey:kUserName];
    
    
    [dataDict setObject:@"getUserDetailsForMenu" forKey:kRequestType];
    [dataDict setObject:userName forKey:kUserName];
    [dataDict setObject:uid forKey:kUid];

    return dataDict;
}

-(NSMutableDictionary *)createFeedRequestDictionary:(JFWFeedsModel *)feedModel
{
    NSNumber *postId = [NSNumber numberWithInt:12];
    NSMutableDictionary *dataDict = [[NSMutableDictionary alloc]init];
    NSString *uid = [[NSUserDefaults standardUserDefaults]objectForKey:kUid];
     NSString *userName = [[NSUserDefaults standardUserDefaults]objectForKey:kUserName];
    
    [dataDict setObject:@"getPostScreenDetails" forKey:kRequestType];
    [dataDict setObject:userName forKey:kUserName];
    [dataDict setObject:uid forKey:kUid];
    [dataDict setObject:postId forKey:@"last_post_id"];

    return dataDict;
}

-(NSMutableDictionary *)createAddFeedRequestDictionary:(JFWFeedsModel *)feedModel
{
    NSNumber *postId = [NSNumber numberWithInt:12];
    NSMutableDictionary *dataDict = [[NSMutableDictionary alloc]init];
    NSString *uid = [[NSUserDefaults standardUserDefaults]objectForKey:kUid];
    NSString *userName = [[NSUserDefaults standardUserDefaults]objectForKey:kUserName];
    NSNumber *isAnonymus = [NSNumber numberWithBool:YES];
    
    [dataDict setObject:@"postNewPost" forKey:kRequestType];
    [dataDict setObject:userName forKey:kUserName];
    [dataDict setObject:uid forKey:kUid];
    [dataDict setObject:feedModel.postTitle forKey:@"post_title"];
    [dataDict setObject:feedModel.postDescription forKey:@"post_description"];
    [dataDict setObject:feedModel.tag1 forKey:@"post_tag_1"];
    [dataDict setObject:feedModel.tag2 forKey:@"post_tag_2"];
    [dataDict setObject:feedModel.tag3 forKey:@"post_tag_3"];
    [dataDict setObject:isAnonymus forKey:@"is_anonymous"];

//
    return dataDict;
}

@end
