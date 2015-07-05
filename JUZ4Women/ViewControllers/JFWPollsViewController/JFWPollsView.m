//
//  JFWPollsView.m
//  JUZ4Women
//
//  Created by Gautam Arora on 13/06/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "JFWPollsView.h"
#import "JFWPollCell.h"
@implementation JFWPollsView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        [self loadSubview];
        [self setUpTableView];
    }
    return self;
}

-(void)loadSubview
{
    NSArray *xibArray = [[NSBundle mainBundle] loadNibNamed:@"JFWPollsView" owner:self options:Nil];
    UIView *view  = [xibArray lastObject];
    view.frame = self.bounds;
    [self addSubview:view];
}

-(void)setUpTableView
{
    [tableViewObj setBackgroundView:nil];
    [tableViewObj setBackgroundColor:[UIColor clearColor]];
}

-(void)reloadView
{
    [tableViewObj reloadData];
}
#pragma mark - Table view methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 76;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"JFWPollCell";
    
    cellObj = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!cellObj)
    {
        [[NSBundle mainBundle]loadNibNamed:@"JFWPollCell" owner:self options:Nil];
    }
    
    [cellObj setPollModelObj:[self.dataArray objectAtIndex:indexPath.row]];
    [cellObj setDataCell];
    return cellObj;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.delegate && [self.delegate respondsToSelector:@selector(questionsSelected:)])
    {
        [self.delegate questionsSelected:[NSNumber numberWithInt:1]];
    }
}


@end
