//
//  OptionModel.h
//  JUZ4Women
//
//  Created by Gautam Arora on 13/06/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OptionModel : NSObject

@property(nonatomic,retain)NSString *optionText;
@property(nonatomic,assign)BOOL isOptionSelected;

-(id)initWithOption:(NSString *)option;

@end
