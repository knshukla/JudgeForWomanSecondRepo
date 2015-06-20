//
//  JFWLegalAdviseViewController.m
//  JUZ4Women
//
//  Created by Kailash on 5/16/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "JFWLegalAdviseViewController.h"
#import "IGLeftMenuViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "IGHomeViewCellTableViewCell.h"
#import "UIViewController+MMDrawerController.h"
#import "JFWAppDelegate.h"
#import "JFWSearchViewController.h"
#import "JFWAddPostViewController.h"
#import "JFWFilterView.h"
#import "JFWLegalAdviceCell.h"
#import "FilterViewController.h"
#import "JFWWebserviceManager.h"


@interface JFWLegalAdviseViewController ()<FilterDelegate>
{
    NSMutableArray *cellImageArray;
    UITableView *tableView;
    UIView *notificationView;
    UILabel *messageLabel;
    JFWFilterView *filterViewObj;
    BOOL isTableOpened;
    FilterViewController *viewController;
    NSArray *responseArray;
    
}
@end

@implementation JFWLegalAdviseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self commanInit];
    [self fetchAdviceFeedDetail];
    
    self.legalAdviceTableView.rowHeight = UITableViewAutomaticDimension;
    self.legalAdviceTableView.estimatedRowHeight = 30.0;
    self.title = @"Legal Advice";
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"app_back.png"]];
    
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:14/255.0 green:61.0/255.0 blue:82.0/255.0 alpha:1];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.postTopViewObj.backgroundColor = [UIColor colorWithRed:26.0/255.0 green:67.0/255.0 blue:96.0/255.0 alpha:1];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
}

-(void)commanInit
{
    [self configureNavBarTitile];
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
    
    JFWLegalAdviceCell *cell = (JFWLegalAdviceCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[JFWLegalAdviceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"JFWLegalAdviceCell" owner:self options:nil];
        cell =  (JFWLegalAdviceCell *)[topLevelObjects objectAtIndex:0];
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    [cell configureCellWithModel:[responseArray objectAtIndex:indexPath.row]];
    
    
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
    
    viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"FilterViewController"];
    viewController.filterType = 1;
    
    viewController.delegate = self;
    
    // [self addChildViewController:viewController];
    
    [viewController.view setFrame:CGRectMake(20, 130, 280, 230)];
    
    viewController.view.layer.cornerRadius = 5.0;
    viewController.view.layer.masksToBounds = YES;
    
    [self.navigationController.view addSubview:viewController.view];
    
    [viewController didMoveToParentViewController:self];
}


- (void)onCancelButtonTapped
{
    [viewController.view removeFromSuperview];
}

-(void)fetchAdviceFeedDetail
{
    JFWWebserviceManager *webServiceManager = [[JFWWebserviceManager alloc]init];
    
    [webServiceManager requestLegalAdviceApiWithArticleModel:nil withSuccessBlock:^(id dataArray)
     {
         responseArray = (NSArray *)dataArray;
         
         [self.legalAdviceTableView reloadData];
         
     } withFailureBlock:^(NSError *error)
     {
         
     }];
}

@end
