//
//  PollModel.m
//  JUZ4Women
//
//  Created by Kailash on 05/07/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "PollModel.h"

@implementation PollModel

-(id)initWithPollId:(NSString *)pollId tag:(NSString *)tag responses:(long )responses status:(int )status question:(NSString *)question startDate:(NSString *)startDate startTime:(NSString *)startTime Option1:(NSString *)option1 option2:(NSString *)option2 option3:(NSString *)option3 option4:(NSString *)option4

{
    self = [super init];
    
    if(self)
    {
        self.pollId = pollId;
        self.tags = tag;
        self.responses = responses;
        
        self.status = status;
        self.startDate = startDate;
        self.startTime = startTime;
        
        self.pollQuestion = question;
        
        self.option1 = [self getOptionModel:option1];
        self.option1 = [self getOptionModel:option2];
        self.option1 = [self getOptionModel:option3];
        self.option1 = [self getOptionModel:option4];
    }
    
    return self;
}

-(OptionModel *)getOptionModel:(NSString *)option
{
    OptionModel *optionModel = [[OptionModel alloc]initWithOption:option];
    
    return optionModel;
}

@end
