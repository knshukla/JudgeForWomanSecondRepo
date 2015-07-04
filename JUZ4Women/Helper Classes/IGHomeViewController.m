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
#import "PopUpView.h"
#import "JFWFeedsModel.h"
#import "JFWWebserviceManager.h"
#import "FilterViewController.h"
#import "PostDescriptionViewController.h"

@interface IGHomeViewController()
{
    NSMutableArray *cellImageArray;
    UITableView *tableView;
    UIView *notificationView;
    UILabel *messageLabel;
    JFWFilterView *filterViewObj;
    BOOL isTableOpened;
    PopUpView *demoView;
    NSArray *responseArray;
    FilterViewController *viewController ;
    NSMutableArray *filterArray;

}
@end

@implementation IGHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self commanInit];
    
    self.homeTableView.rowHeight = UITableViewAutomaticDimension;
    self.homeTableView.estimatedRowHeight = 30.0;
    self.title = @"Post";
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"app_back.png"]];

    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:14/255.0 green:61.0/255.0 blue:82.0/255.0 alpha:1];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.postTopViewObj.backgroundColor = [UIColor colorWithRed:26.0/255.0 green:67.0/255.0 blue:96.0/255.0 alpha:1];
    
    [self fetchFeedDetail];
}

-(void)fetchFeedDetail
{
    JFWWebserviceManager *webServiceManager = [[JFWWebserviceManager alloc]init];
    
    [webServiceManager requestFeedApiWithFeedModel:nil withSuccessBlock:^(id dataArray)
    {
        responseArray = (NSArray *)dataArray;
        [self.homeTableView reloadData];
    } withFailureBlock:^(NSError *error)
    {
        
    }];
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

    return responseArray.count;
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
    [cell configureCell:[responseArray objectAtIndex:indexPath.row]];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PostDescriptionViewController *postDescriptionController = [self.storyboard instantiateViewControllerWithIdentifier:@"PostDescriptionViewController"];
    
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:postDescriptionController];
    
    [self presentViewController:navController animated:YES completion:nil];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    //Obviously, if this returns no, the edit option won't even populate
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    //Nothing gets called here if you invoke `tableView:editActionsForRowAtIndexPath:` according to Apple docs so just leave this method blank
}

-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewRowAction *delete = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"Delete" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath)
                                    {
                                        // Delete something here
                                    }];
    delete.backgroundColor = [UIColor redColor];
    
    UITableViewRowAction *more = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@" More " handler:^(UITableViewRowAction *action, NSIndexPath *indexPath)
                                  {
                                      //Just as an example :
                                      NSLog(@"zcx");
                                  }];
    more.backgroundColor = [UIColor colorWithRed:0.188 green:0.514 blue:0.984 alpha:1];
    
    return @[delete, more]; //array with all the buttons you want. 1,2,3, etc...
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
//    NSArray *nibObjects=[[NSBundle mainBundle] loadNibNamed:@"PopUpView" owner:nil options:nil];
//    
//    demoView = [nibObjects objectAtIndex:0];
//    [demoView setFrame:CGRectMake(30, 150, 300, 270)];
//    demoView.backgroundColor = [UIColor greenColor];
//    
//    [self.view addSubview:demoView];
    
    viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"FilterViewController"];
    viewController.delegate = self;
    
   // [self addChildViewController:viewController];
    
    [viewController.view setFrame:CGRectMake(20, 130, 280, 300)];
    viewController.filterType = kFeedType;
    
    viewController.view.layer.cornerRadius = 5.0;
    viewController.view.layer.masksToBounds = YES;
    
    [self.navigationController.view addSubview:viewController.view];
    
    [viewController didMoveToParentViewController:self];
}


- (void)onCancelButtonTapped
{
    [viewController.view removeFromSuperview];
}


@end
