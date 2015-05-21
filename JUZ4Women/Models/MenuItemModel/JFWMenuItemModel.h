//
//  JFWMenuItemModel.h
//  JUZ4Women
//
//  Created by Kailash on 5/3/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JFWMenuItemModel : NSObject

@property (nonatomic) NSString *menuItemName;
@property (nonatomic) NSString *menuItemImageName;

-(id) initWithMenuItemName:(NSString *)itemName withImageName:(NSString *)imageName;

@end
