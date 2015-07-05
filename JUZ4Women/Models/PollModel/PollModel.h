//
//  PollModel.h
//  JUZ4Women
//
//  Created by Kailash on 05/07/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "OptionModel.h"

@interface PollModel : NSObject

@property(nonatomic, retain)NSString *pollId;

@property(nonatomic, assign)int status;
@property(nonatomic, assign)long responses;

@property(nonatomic, retain)NSString *pollQuestion;
@property(nonatomic, retain)NSString *tags;
@property(nonatomic, retain)NSString *startDate;
@property(nonatomic, retain)NSString *startTime;

@property(nonatomic, retain)OptionModel *option1;
@property(nonatomic, retain)OptionModel *option2;
@property(nonatomic, retain)OptionModel *option3;
@property(nonatomic, retain)OptionModel *option4;


-(id)initWithPollId:(NSString *)pollId tag:(NSString *)tag responses:(long )responses status:(int )status question:(NSString *)question startDate:(NSString *)startDate startTime:(NSString *)startTime Option1:(NSString *)option1 option2:(NSString *)option2 option3:(NSString *)option3 option4:(NSString *)option4;

@end
