//
//  MFParserManager.m
//  MediaFoundryMobileApp
//
//  Created by Kailash on 4/18/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "JFWParserManager.h"
#import "JFWLoginModel.h"
#import "JFWAppConstants.h"

@implementation JFWParserManager

-(JFWLoginModel *)parseLoginResponseWith:(NSDictionary *)responseDict
{
    JFWLoginModel *loginModel = [[JFWLoginModel alloc]initWithUserName:[responseDict objectForKey:kUserName] withPassword:nil withUid:[responseDict objectForKey:kUid] withUserTypeId:(int)[responseDict objectForKey:kUserTypeId]];
    
    return loginModel;

}

@end
