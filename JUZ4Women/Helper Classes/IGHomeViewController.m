//
//  HomeViewController.m
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "IGHomeViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import "IGLeftMenuViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "IGHomeViewCellTableViewCell.h"
#import "UIViewController+MMDrawerController.h"
#import "JFWAppDelegate.h"
#import "JFWSearchViewController.h"
#import "JFWAddPostViewController.h"
#import "JFWFilterView.h"


@interface IGHomeViewController()
{
    NSMutableArray *cellImageArray;
    UITableView *tableView;
    UIView *notificationView;
    UILabel *messageLabel;
    JFWFilterView *filterViewObj;
    BOOL isTableOpened;

}
@end

@implementation IGHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self commanInit];
    self.title = @"Post";
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"app_back.png"]];

    [self configureDropDownMenu];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:14/255.0 green:61.0/255.0 blue:82.0/255.0 alpha:1];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.postTopViewObj.backgroundColor = [UIColor colorWithRed:26.0/255.0 green:67.0/255.0 blue:96.0/255.0 alpha:1];
}

-(void)viewWillAppear:(BOOL)animated
{
}

-(void)commanInit
{
    [self configureNavBarTitile];
    [self configureRightNavBar];
    [self configureLeftNavBar];
    cellImageArray = [[NSMutableArray alloc]init];
}
-(void)configureNavBarTitile
{
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
}

-(void)configureLeftNavBar
{
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    rightButton.frame = CGRectMake(0, 0, 30, 30);
    
    [rightButton setImage:[UIImage imageNamed:@"column_icon"] forState:UIControlStateNormal];
    
     [rightButton addTarget:self action:@selector(onNavBarButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;

}

-(void)configureRightNavBar
{
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    rightButton.frame = CGRectMake(0, 0, 30, 30);
    
    [rightButton setImage:[UIImage imageNamed:@"column_icon"] forState:UIControlStateNormal];
    
    [rightButton addTarget:self action:@selector(onNavBarButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemSearch target:self action:@selector(onSearchButtonTapped)];
    
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
}


-(void)onSearchButtonTapped
{
    [self presentSearchViewController];
}

-(void)presentSearchViewController
{
    JFWSearchViewController *searchViewControllerObj = [self.storyboard instantiateViewControllerWithIdentifier:@"JFWSearchViewController"];
    
    UINavigationController *navControllerObj = [[UINavigationController alloc] initWithRootViewController:searchViewControllerObj];
    
    [self presentViewController:navControllerObj animated:YES completion:nil];
}

-(void)onNavBarButtonTapped
{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}


#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
	return NO;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
	return NO;
}




#pragma mark - TableView delegate methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //Returing number of rows in section of tableview

    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    //Intilizing the table cell
    static NSString* cellIdentifier = @"cellIdentifier";
    
    IGHomeViewCellTableViewCell *cell = (IGHomeViewCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[IGHomeViewCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"IGHomeViewCellTableViewCell" owner:self options:nil];
        cell =  (IGHomeViewCellTableViewCell *)[topLevelObjects objectAtIndex:0];
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    cell.backgroundColor = [UIColor clearColor];
    
    cell.userImageView.layer.cornerRadius = 25;
    cell.userImageView.layer.masksToBounds = YES;
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}


- (IBAction)onAddPostButtonTapped:(id)sender
{
    JFWAddPostViewController *addPostViewControllerObj = [self.storyboard instantiateViewControllerWithIdentifier:@"JFWAddPostViewController"];
    
    UINavigationController *navControllerObj = [[UINavigationController alloc] initWithRootViewController:addPostViewControllerObj];
    
    [self presentViewController:navControllerObj animated:YES completion:nil];
}

- (IBAction)onEditPostButtonTapped:(id)sender
{
    [self presentSearchViewController];

}

- (IBAction)onFilterButtonTapped:(id)sender
{

    [UIView animateWithDuration:0.4f animations:^{
        if (isTableOpened)
        {
            isTableOpened = NO;
            
            [filterViewObj setFrame:CGRectMake(180, 110,150 , 0)];
            
            
        }
        else
        {
            isTableOpened = YES;
            
            [filterViewObj setFrame:CGRectMake(180, 110,150 , 150)];
        
    }
    }];

}

-(void)configureDropDownMenu
{
    isTableOpened = NO;
    
    //Initilizing View
    filterViewObj = [[JFWFilterView alloc] initWithFrame:CGRectMake(180, 110,150 , 0)];
    
    filterViewObj.backgroundColor = [UIColor grayColor];
    
 [[UIApplication sharedApplication].keyWindow.rootViewController.view insertSubview:filterViewObj atIndex:2];
    //Initlizing tableview and setting its properties
   }

@end
