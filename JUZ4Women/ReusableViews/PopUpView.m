//
//  DemoView.m
//  TableViewTest
//
//  Created by Kailash on 6/5/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "PopUpView.h"

@implementation PopUpView


- (void) awakeFromNib
{
    [super awakeFromNib];
    
    [self initilizeView];
}

-(void)initilizeView
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 50, 300, 175) style:UITableViewStylePlain];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self addSubview:tableView];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // More initialization code
    }
    return self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:MyIdentifier];
    }
    
    
    cell.textLabel.text = @"My Text";
    cell.backgroundColor = [UIColor purpleColor];
    return cell;
}

@end
