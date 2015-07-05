//
//  FilterViewController.m
//  JUZ4Women
//
//  Created by Kailash on 6/18/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "FilterViewController.h"
#import "FilterTableViewCell.h"
@interface FilterViewController ()
{
    NSArray *feedFilterArray;
    NSArray *videoFilterArray;

}
@end

@implementation FilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    feedFilterArray = [self createFilterArray];
    videoFilterArray = [self createLegalAdviceArray];
    if(self.filterType == kVideoType)
    {
        self.tableViewHeightConstraints.constant = 132;
        NSLog(@"height is %f",self.tableView.frame.size.height);

    }
    else
    {
        NSLog(@"IN else block");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView delegate methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //Returing number of rows in section of tableview
    if(self.filterType == kFeedType)
    {
        return feedFilterArray.count;


    }
    else if(self.filterType == kVideoType)
    {
        return videoFilterArray.count;


    }
    else if(self.filterType == kPoll)
    {
        return feedFilterArray.count;
    }
    else
    {
        return 2;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //Intilizing the table cell
    static NSString* cellIdentifier = @"cellIdentifier";
    
    FilterTableViewCell *cell = (FilterTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[FilterTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"FilterTableViewCell" owner:self options:nil];
        cell =  (FilterTableViewCell *)[topLevelObjects objectAtIndex:0];
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    cell.backgroundColor = [UIColor clearColor];
    //cell.notificationTitleLabel.text =@"fdjhfjdhfd";
    
    if(self.filterType == kFeedType)
    {
        cell.titleLabel.text = [feedFilterArray objectAtIndex:indexPath.row];
        
    }
    else if(self.filterType == kVideoType)
    {
        cell.titleLabel.text = [videoFilterArray objectAtIndex:indexPath.row];
    }
    else if(self.filterType == kPoll)
    {
        cell.titleLabel.text = [feedFilterArray objectAtIndex:indexPath.row];
    }
    else
    {
        cell.titleLabel.text = [feedFilterArray objectAtIndex:indexPath.row];
    }
    
    
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


- (IBAction)onCancelButtonTapped:(id)sender
{
    [self.delegate onCancelButtonTapped];
}

-(NSMutableArray *)createFilterArray
{
    NSMutableArray *filterArray = [[NSMutableArray alloc]init];
    [filterArray addObject:@"Newest"];
    [filterArray addObject:@"Most Liked"];
    [filterArray addObject:@"Admin Post"];
    [filterArray addObject:@"Most Disliked"];
    [filterArray addObject:@"Post of the Day"];
    
    return filterArray;
    
}

-(NSMutableArray *)createLegalAdviceArray
{
    NSMutableArray *filterArray = [[NSMutableArray alloc]init];
    [filterArray addObject:@"Newest"];
    [filterArray addObject:@"Most Liked"];
    [filterArray addObject:@"Most Connected"];
    
    return filterArray;
    
}

-(NSMutableArray *)createPollArray
{
    NSMutableArray *filterArray = [[NSMutableArray alloc]init];
    [filterArray addObject:@"Newest"];
    
    return filterArray;
    
}

@end
