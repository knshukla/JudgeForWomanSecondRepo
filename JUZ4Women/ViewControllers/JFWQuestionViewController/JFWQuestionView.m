//
//  JFWQuestionView.m
//  JUZ4Women
//
//  Created by Gautam Arora on 13/06/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "JFWQuestionView.h"
#import "OptionModel.h"

@implementation JFWQuestionView

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
    NSArray *xibArray = [[NSBundle mainBundle] loadNibNamed:@"JFWQuestionView" owner:self options:Nil];
    UIView *view  = [xibArray lastObject];
    view.frame = self.bounds;
    [self addSubview:view];
}

-(void)setUpTableView
{
    [optionsTable setBackgroundView:nil];
    [optionsTable setBackgroundColor:[UIColor clearColor]];
}

#pragma mark - Table view methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return optionsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"OptionTableCell";
    
    cellObj = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!cellObj)
    {
        [[NSBundle mainBundle]loadNibNamed:@"OptionTableCell" owner:self options:Nil];
    }
    
    OptionModel *optionModelObj = [optionsArray objectAtIndex:indexPath.row];
    [cellObj setDataOnCell:optionModelObj];
    
    return cellObj;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self updateSelectionInOptionmodelArray:indexPath];
    [optionsTable reloadData];
}

-(void)updateSelectionInOptionmodelArray : (NSIndexPath *)indexPath
{
    for (int index = 0; index < optionsArray.count; index++)
    {
        OptionModel *optionModelObj = [optionsArray objectAtIndex:index];
        
        if(index == indexPath.row)
        {
            optionModelObj.isOptionSelected = YES;
        }
        else
        {
            optionModelObj.isOptionSelected = NO;
        }
    }
}
- (IBAction)submitButtonTapped:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(submitButtonTapped)])
    {
        [self.delegate submitButtonTapped];
    }
    
}

#pragma mark - Interface methods

-(void)loadOptionsData:(NSMutableArray *)data;
{
    optionsArray =  data;
    [optionsTable reloadData];
}


@end
