//
//  JFWPollsView.h
//  JUZ4Women
//
//  Created by Gautam Arora on 13/06/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JFWPollCell;

@protocol JFWPollsViewDelegate <NSObject>

-(void)questionsSelected:(id)data;

@end
@interface JFWPollsView : UIView <UITableViewDataSource,UITableViewDelegate>
{
    
    __weak IBOutlet UITableView *tableViewObj;
    IBOutlet JFWPollCell *cellObj;
}


-(void)reloadView;

@property(nonatomic,retain)id <JFWPollsViewDelegate> delegate;
@property(nonatomic, retain)NSMutableArray *dataArray;

@end
