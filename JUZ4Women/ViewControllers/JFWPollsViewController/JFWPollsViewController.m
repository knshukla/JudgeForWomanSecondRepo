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

#import "JFWPollsView.h"

@interface JFWPollsViewController ()

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

}

-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"%@",NSStringFromCGRect(self.view.bounds));
    [self loadPollViews];

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
        return;
    
    jFWPollsViewObj = [[JFWPollsView alloc]initWithFrame:self.view.bounds];
    jFWPollsViewObj.delegate = self;
    [self.view addSubview:jFWPollsViewObj];
}

#pragma mark - View delegate methods
-(void)questionsSelected:(id)data
{
    JFWQuestionViewController *questionsController = [[JFWQuestionViewController alloc]initWithNibName:@"JFWQuestionViewController" bundle:Nil];
    
    NSLog(@"%@",questionsController);
    [self.navigationController pushViewController:questionsController animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
