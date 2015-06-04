//
//  JFWLoginModel.m
//  JUZ4Women
//
//  Created by Kailash on 5/31/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "JFWLoginModel.h"

@implementation JFWLoginModel

-(id)initWithUserName:(NSString *)userName withPassword:(NSString *)password
{
    self = [super init];
    if(self)
    {
        self.userName = userName;
        self.password = password;
    }
    return self;
}

@end
