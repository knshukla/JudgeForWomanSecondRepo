//
//  JFWPollCell.h
//  JUZ4Women
//
//  Created by Gautam Arora on 13/06/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PollModel.h"

@interface JFWPollCell : UITableViewCell
{
    
    __weak IBOutlet UILabel *questionLabel;
    __weak IBOutlet UILabel *timeLabel;
    __weak IBOutlet UILabel *tagLabel;
}

@property(nonatomic, retain)PollModel *pollModelObj;

-(void)setDataCell;

@end
