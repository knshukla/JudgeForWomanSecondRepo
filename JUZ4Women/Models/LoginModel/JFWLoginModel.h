//
//  JFWLoginModel.h
//  JUZ4Women
//
//  Created by Kailash on 5/31/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JFWLoginModel : NSObject

@property (nonatomic) NSString *userName;
@property (nonatomic) NSString *password;

-(id)initWithUserName:(NSString *)userName withPassword:(NSString *)password;
@end
