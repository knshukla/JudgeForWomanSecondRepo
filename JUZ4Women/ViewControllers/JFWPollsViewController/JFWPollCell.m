//
//  JFWPollCell.m
//  JUZ4Women
//
//  Created by Gautam Arora on 13/06/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "JFWPollCell.h"
#import "JFWUtilities.h"
#include "NSDate+Utilities.h"

@implementation JFWPollCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setDataCell
{
    if (!self.pollModelObj) {
        return;
    }
    
    [tagLabel setText:self.pollModelObj.tags];
    
    [questionLabel setText:self.pollModelObj.pollQuestion];
    
    [self setDataOnTimeLabel];
}

-(void)setDataOnTimeLabel
{
    NSDate *date = [JFWUtilities getDateFromDate:self.pollModelObj.startDate andTime:self.pollModelObj.startTime];
    
    NSInteger hours = [[NSDate date] hoursAfterDate:date];
    
    [timeLabel setText:[NSString stringWithFormat:@"%ld hrs ago",hours]];
}
@end
