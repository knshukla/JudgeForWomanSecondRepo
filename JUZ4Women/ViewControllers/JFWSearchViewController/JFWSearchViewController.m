//
//  JFWSearchViewController.m
//  JUZ4Women
//
//  Created by Kailash on 5/3/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "JFWSearchViewController.h"

@interface JFWSearchViewController ()

@end

@implementation JFWSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configureLeftNavBar];
    [self configureNavBarTitile];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)configureNavBarTitile
{
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    self.title = @"Search";
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:14/255.0 green:61.0/255.0 blue:82.0/255.0 alpha:1];

}

-(void)configureLeftNavBar
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    leftButton.frame = CGRectMake(0, 0, 30, 30);
    
    [leftButton setImage:[UIImage imageNamed:@"back_icon"] forState:UIControlStateNormal];
    
    [leftButton addTarget:self action:@selector(onNavBarBackButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
}

-(void)onNavBarBackButtonTapped
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
