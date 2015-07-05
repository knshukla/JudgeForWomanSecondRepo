//
//  FilterManager.h
//  JUZ4Women
//
//  Created by Aakash sharma on 06/07/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JFWAppConstants.h"


@interface FilterManager : NSObject

+(NSMutableArray *)filterArray:(NSMutableArray *)dataArray WithFilter:(DataFilterType)filterType;

@end
