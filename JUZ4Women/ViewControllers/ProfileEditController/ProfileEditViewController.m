//
//  ProfileEditViewController.m
//  JUZ4Women
//
//  Created by Kailash on 6/26/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "ProfileEditViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "ProfileTableViewCell.h"
#import "JFWWebserviceManager.h"
#import "UserModel.h"
#import "JFWAppConstants.h"
#import "UIImageView+AFNetworking.h"
#import "JFWUtilities.h"
#import "ArticleModel.h"

@interface ProfileEditViewController ()

@end

@implementation ProfileEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:14/255.0 green:61.0/255.0 blue:82.0/255.0 alpha:1];
    
    self.title = @"Profile Edit";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    [self configureLeftNavBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)configureLeftNavBar
{
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    rightButton.frame = CGRectMake(0, 0, 30, 30);
    
    [rightButton setImage:[UIImage imageNamed:@"back_icon"] forState:UIControlStateNormal];
    
    [rightButton addTarget:self action:@selector(onNavBarButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
}

-(void)onNavBarButtonTapped
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
