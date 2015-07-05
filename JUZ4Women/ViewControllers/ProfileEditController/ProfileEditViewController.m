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
#import "MFAppConstants.h"
#import "UIImageView+AFNetworking.h"
#import "UserModel.h"

@interface ProfileEditViewController ()
{
    __weak IBOutlet UIImageView *profileImageView;
    __weak IBOutlet UILabel *nameLabel;
    __weak IBOutlet UILabel *ageLabel;
    __weak IBOutlet UILabel *realName;
    __weak IBOutlet UILabel *displayName;
    __weak IBOutlet UILabel *dateOfBirth;
    __weak IBOutlet UILabel *emailLabel;
    __weak IBOutlet UILabel *anotherEmailLabel;
    __weak IBOutlet UILabel *passwordLabel;
    __weak IBOutlet UILabel *confirmPasswordLabel;
    
    __weak IBOutlet UITextField *realNameTextField;
    __weak IBOutlet UITextField *displayNameTextField;
    __weak IBOutlet UITextField *dateOfBirthTextField;
    __weak IBOutlet UITextField *emailTextField;
    __weak IBOutlet UITextField *anotherEmailTextField;
    __weak IBOutlet UITextField *passwordTextField;
    __weak IBOutlet UITextField *confirmPasswordTextField;
    
    __weak IBOutlet UILabel *postCountLabel;
    __weak IBOutlet UILabel *postAnsCountLabel;
    __weak IBOutlet UILabel *favoriteArticleCount;
    __weak IBOutlet UILabel *favoriteVideoCount;
    
}

- (IBAction)onDoneButtonTapped:(id)sender;

@end

@implementation ProfileEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    profileImageView.layer.cornerRadius = 25;
    profileImageView.layer.masksToBounds = YES;
    
    [self updateView:self.userModel];
    
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


- (IBAction)onDoneButtonTapped:(id)sender {
}

-(void)updateView:(UserModel *)userModel
{
    nameLabel.text = userModel.userName;
    NSString *userAge = [NSString stringWithFormat:@"%ld years",userModel.userAge];
    ageLabel.text = userAge;
    
    NSString *finalUrl = [NSString stringWithFormat:@"%@/%@",kBaseUrl,userModel.imageUrl];
    
    postCountLabel.text = [NSString stringWithFormat:@"%ld",userModel.userTotalPostCount];
    
   postAnsCountLabel.text = [NSString stringWithFormat:@"%ld",userModel.userTotalPostAnswerd];
    
    favoriteArticleCount.text = [NSString stringWithFormat:@"%ld",userModel.userTotalFavoriteVideos];
    
    
    favoriteVideoCount.text = [NSString stringWithFormat:@"%ld",userModel.userTotalFavoriteArticle];
    
    realNameTextField.text = userModel.realName;
    displayNameTextField.text = userModel.displayName;
    //dateOfBirth.text = userModel.dateOfBirth;
    emailTextField.text = userModel.emailAddress;
    passwordTextField.text = userModel.password;
    confirmPasswordTextField.text = userModel.password;
    anotherEmailTextField.text = userModel.emailAddress;
    
    NSMutableURLRequest *imageRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:finalUrl]];
    [profileImageView setImageWithURLRequest:imageRequest placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image)
     {
         [profileImageView setImage:image];
         
     }failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error)
     {
         
     }];
    
    
    
}

@end
