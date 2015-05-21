//
//  JFWContactUsViewController.m
//  JUZ4Women
//
//  Created by Kailash on 5/16/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "JFWContactUsViewController.h"
#import "JFWUtilities.h"
#import "UIViewController+MMDrawerController.h"

@interface JFWContactUsViewController ()

@end

@implementation JFWContactUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureLeftNavBar];
    [self configureNavBarTitile];
    [self configureScrollView];
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)configureView
{
    //self.textViewObj.text = @"Description";
    
    [self.view sendSubviewToBack:self.textViewBackgroundImageView];
    [JFWUtilities setPlaceHolderTextColor:self.tag1TextFieldObj color:[UIColor whiteColor]];
    [JFWUtilities setPlaceHolderTextColor:self.tag2TextFieldObj color:[UIColor whiteColor]];
    [JFWUtilities setPlaceHolderTextColor:self.tag3TextFieldObj color:[UIColor whiteColor]];
    [JFWUtilities setPlaceHolderTextColor:self.titleTextFieldObj color:[UIColor whiteColor]];
}

-(void)configureScrollView
{
    self.scrollViewObj.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"app_back.png"]];
}



-(void)configureNavBarTitile
{
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:14/255.0 green:61.0/255.0 blue:82.0/255.0 alpha:1];
   self.title = @"Contact Us";
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

-(void)onNavBarButtonTapped
{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}


-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    self.textViewObj.text = @"";
    self.textViewObj.textColor = [UIColor whiteColor];
    return YES;
}

-(void) textViewDidChange:(UITextView *)textView
{
    if(self.textViewObj.text.length == 0)
    {
        //self.textViewObj.text = @"Description";
        [self.textViewObj resignFirstResponder];
    }
}


@end
