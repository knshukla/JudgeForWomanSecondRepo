//
//  JFWQuestionView.h
//  JUZ4Women
//
//  Created by Gautam Arora on 13/06/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "OptionTableCell.h"

@protocol JFWQuestionViewDelegate <NSObject>

-(void)optionSelected;
-(void)submitButtonTapped;

@end


@interface JFWQuestionView : UIView <UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet OptionTableCell *cellObj;
    
    __weak IBOutlet UITableView *optionsTable;
    
    NSMutableArray *optionsArray;
}
@property(nonatomic,retain)id<JFWQuestionViewDelegate> delegate;

-(void)loadOptionsData:(NSMutableArray *)data;

@end
