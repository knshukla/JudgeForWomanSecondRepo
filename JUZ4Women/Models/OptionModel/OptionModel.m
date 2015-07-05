//
//  OptionModel.m
//  JUZ4Women
//
//  Created by Gautam Arora on 13/06/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "OptionModel.h"

@implementation OptionModel

-(id)initWithOption:(NSString *)option
{
    self = [super init];
    
    if(self)
    {
        self.optionText = option;
    }
    
    return self;
}


@end
