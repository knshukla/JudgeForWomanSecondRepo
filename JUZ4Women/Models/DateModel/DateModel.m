//
//  DateModel.m
//  JUZ4Women
//
//  Created by Kailash on 14/06/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "DateModel.h"

@implementation DateModel

-(id)initWithDay:(int )dd month:(int )mm andYear:(int )yy
{
    self = [super init];
    if(self)
    {
        self.dd = dd;
        self.mm = mm;
        self.yyyy = yy;
    }
    return self;
}

@end
