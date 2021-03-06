//
//  JFWPollsViewController.m
//  JUZ4Women
//
//  Created by Kailash on 5/3/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "JFWPollsViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "JFWQuestionViewController.h"
#import "JFWGraphViewController.h"

#import "JFWPollsView.h"
#import "JFWWebserviceManager.h"

#import "JFWUtilities.h"
#import "PollModel.h"

@interface JFWPollsViewController ()
{
    long lastPollId;
    
    NSMutableArray *dataArray;
}

@end

@implementation JFWPollsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    
    // Do any additional setup after loading the view.
    [self configureLeftNavBar];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:14/255.0 green:61.0/255.0 blue:82.0/255.0 alpha:1];
    self.title = @"Polls";
     self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    lastPollId = 0;

}

-(void)viewWillAppear:(BOOL)animated
{
    [self getPollScreenData];
    [self loadPollViews];
}

-(void)getPollScreenData
{
    JFWWebserviceManager *webServiceManager = [[JFWWebserviceManager alloc]init];
    
    [webServiceManager requestPollsDataWithLastPollId:lastPollId withSuccessBlock:^(id array)
     {
         if (!dataArray) {
             dataArray = [[NSMutableArray alloc]init];
             [dataArray addObjectsFromArray:array];
         }
         else
             [dataArray addObjectsFromArray:array];
         
         [self loadPollViews];
         
     } withFailureBlock:^(NSError *error)
     {
         [JFWUtilities showAlert:NSLocalizedString(@"UNKNOWN_ERROR", nil)];
         
     }];
}

-(void)viewDidAppear:(BOOL)animated
{
    
}

#pragma mark - navigation bar methods
-(void)configureLeftNavBar
{
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    rightButton.frame = CGRectMake(0, 0, 30, 30);
    
    [rightButton setImage:[UIImage imageNamed:@"column_icon"] forState:UIControlStateNormal];
    
    [rightButton addTarget:self action:@selector(onNavBarButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    	
}

-(void)onNavBarButtonTapped
{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}


-(void)loadPollViews
{
    if(jFWPollsViewObj)
    {
        [jFWPollsViewObj setDataArray:dataArray];
        [jFWPollsViewObj reloadView];
        
        return;
        
    }
    
    jFWPollsViewObj = [[JFWPollsView alloc]initWithFrame:self.view.bounds];
    jFWPollsViewObj.delegate = self;
    
    [jFWPollsViewObj setDataArray:dataArray];
    
    [self.view addSubview:jFWPollsViewObj];
}

#pragma mark - View delegate methods
-(void)questionsSelected:(PollModel *)data
{
    if (!data) {
        return;
    }
    
    if (data.status)
    {
        [self loadGraphView:data];
    }
    else
        [self loadQuestionViewControler:data];
}

-(void)loadDataFromIndexPath
{
     PollModel *poll = [dataArray lastObject];
     lastPollId = poll.pollId.longLongValue;
    
    [self getPollScreenData];
}

-(void)loadQuestionViewControler:(PollModel *)pollData
{
    JFWQuestionViewController *questionsController = [[JFWQuestionViewController alloc]initWithNibName:@"JFWQuestionViewController" bundle:Nil];
    
    [self.navigationController pushViewController:questionsController animated:YES];
}

-(void)loadGraphView:(PollModel *)pollData
{
    JFWGraphViewController *graphViewController = [[JFWGraphViewController alloc]initWithNibName:@"JFWGraphViewController" bundle:nil];
    
    [self.navigationController pushViewController:graphViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
