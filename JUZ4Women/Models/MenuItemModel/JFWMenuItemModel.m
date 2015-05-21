//
//  JFWMenuItemModel.m
//  JUZ4Women
//
//  Created by Kailash on 5/3/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "JFWMenuItemModel.h"

@implementation JFWMenuItemModel


-(id) initWithMenuItemName:(NSString *)itemName withImageName:(NSString *)imageName
{
    if(self)
    {
        self = [super init];
        self.menuItemName = itemName;
        self.menuItemImageName = imageName;
        
    }
    
    return self;
    
}
@end
