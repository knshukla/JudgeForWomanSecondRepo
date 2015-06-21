//
//  JFWAddPostViewController.m
//  JUZ4Women
//
//  Created by Kailash on 5/3/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "JFWAddPostViewController.h"
#import "JFWUtilities.h"
#import "JFWWebserviceManager.h"
#import "JFWFeedsModel.h"

@interface JFWAddPostViewController ()

@end

@implementation JFWAddPostViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configureLeftNavBar];
    [self configureNavBarTitile];
    [self configureScrollView];
    [self configureView];
}

-(void)configureView
{
    self.textViewObj.text = @"Description";
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)configureNavBarTitile
{
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:14/255.0 green:61.0/255.0 blue:82.0/255.0 alpha:1];
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"writeyourmind.png"]];
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
        self.textViewObj.text = @"Description";
        [self.textViewObj resignFirstResponder];
    }
}

- (IBAction)onSubmitButtonTapped:(id)sender
{
    JFWFeedsModel *feedModel = [[JFWFeedsModel alloc]initWithPostId:1 withLikeCount:0.0 withDislikeCount:0.0 withcommentsCount:0.0 withPostTitle:self.titleTextFieldObj.text withTags:nil withUserAvatorUrl:nil withTag1:self.tag1TextFieldObj.text withTag2:self.tag2TextFieldObj.text withTag3:self.tag3TextFieldObj.text withPostDescription:self.textViewObj.text withPostDate:nil withPostTime:nil];
    
    JFWWebserviceManager *webServiceManager = [[JFWWebserviceManager alloc]init];
    
    [webServiceManager requestAddFeedApiWithFeedModel:feedModel withSuccessBlock:^(id dataArray)
     {
         
     } withFailureBlock:^(NSError *error)
     {
         
     }];
}
@end
