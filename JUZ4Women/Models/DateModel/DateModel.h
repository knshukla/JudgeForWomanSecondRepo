//
//  DateModel.h
//  JUZ4Women
//
//  Created by Aakash sharma on 14/06/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateModel : NSObject

@property(nonatomic, assign) int dd;
@property(nonatomic, assign) int mm;
@property(nonatomic, assign) int yyyy;

-(id)initWithDay:(int )dd month:(int )mm andYear:(int )yy;

@end
