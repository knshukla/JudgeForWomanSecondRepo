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
@implementation JFWRequestDictionaryGenerator

-(NSMutableDictionary *)createLoginRequestDictionary:(JFWLoginModel *)loginModel
{
    NSMutableDictionary *dataDict = [[NSMutableDictionary alloc]init];
    
    [dataDict setObject:@"loginAuthentication" forKey:kRequestType];
    [dataDict setObject:@"vivekbansal" forKey:kUserName];
    [dataDict setObject:@"vivek123" forKey:kPassword];
    
    return dataDict;
}

-(NSMutableDictionary *)createLeftMenuRequestDictionary:(JFWLeftMenuModel *)leftMenuModel
{
    NSMutableDictionary *dataDict = [[NSMutableDictionary alloc]init];
    NSString *uid = [[NSUserDefaults standardUserDefaults]objectForKey:kUid];
    NSString *userName = [[NSUserDefaults standardUserDefaults]objectForKey:kUserName];
    
    
    [dataDict setObject:@"getUserDetailsForMenu" forKey:kRequestType];
    [dataDict setObject:userName forKey:kUserName];
    [dataDict setObject:uid forKey:kUid];

    return dataDict;
}
@end
