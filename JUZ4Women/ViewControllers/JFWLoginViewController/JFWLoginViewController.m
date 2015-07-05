//
//  JFWLoginViewController.m
//  JUZ4Women
//
//  Created by Kailash on 5/10/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "JFWLoginViewController.h"
#import "IGLeftMenuViewController.h"
#import "IGHomeViewController.h"
#import "JFWAppDelegate.h"
#import "MMDrawerController.h"
#import "MMExampleCenterTableViewController.h"
#import "MMExampleLeftSideDrawerViewController.h"
#import "MMExampleRightSideDrawerViewController.h"
#import "MMDrawerVisualState.h"
#import "MMExampleDrawerVisualStateManager.h"
#import "MMNavigationController.h"
#import "JFWUtilities.h"
#import "JFWWebserviceManager.h"
#import "JFWLoginModel.h"
#import "UserModel.h"
#import "JFWForgotPasswordViewController.h"
#import "IGSocialManager.h"
//#import <FBSDKCoreKit/FBSDKCoreKit.h>
//#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "JFWGraphViewController.h"
#import <GooglePlus/GooglePlus.h>
#import <GoogleOpenSource/GoogleOpenSource.h>


@interface JFWLoginViewController ()<ForgetPasswordDelegate,SocialManagerDelegate>
{
    IGSocialManager *socialManagerObj;

    JFWForgotPasswordViewController *viewController;
    
    
    __weak IBOutlet UIView *topView;

}
@property (nonatomic,strong) MMDrawerController * drawerController;
@end

@implementation JFWLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    socialManagerObj = [[IGSocialManager alloc]init];
    socialManagerObj.socialLoginDelegate = self;
    [socialManagerObj getRequestToken];
    
//    FBSDKLoginButton *fbLoginButton = [[FBSDKLoginButton alloc] initWithFrame:CGRectMake(80, 480, 41, 37)];
//    [fbLoginButton setDelegate:self];
//      UIImage *fbIconImage = [UIImage imageNamed:@"facebook_icon.png"];
//    fbLoginButton.titleLabel.text = @"";
//    
//    fbLoginButton.backgroundColor = [UIColor clearColor];
//    [fbLoginButton setBackgroundImage:fbIconImage forState:UIControlStateNormal];
//    
//    [fbLoginButton setBackgroundImage:fbIconImage forState:UIControlStateSelected];

    
    
  
    
   // [fbLoginButton setImage:nil forState:UIControlStateNormal];
    
    // fbLoginButton.center = self.view.center;
    //[self.view addSubview:fbLoginButton];

    [self configureStatusBar];
    [self configureTextField];
    [self configureScrollView];
}

-(void)configureScrollView
{
    //self.scrollViewObj.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"app_back.png"]];
    
    //topView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"app_back.png"]];
}

-(void)configureStatusBar
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}


-(void)configureTextField
{
    [JFWUtilities setPlaceHolderTextColor:self.usernameTextField color:[JFWUtilities placeHolderTextColor]];
    [JFWUtilities setPlaceHolderTextColor:self.passwordTextField color:[JFWUtilities placeHolderTextColor]];

}
-(void)viewWillDisappear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSignInButtonTapped:(id)sender
{
    if([self.usernameTextField.text isEqualToString:@""] || [self.passwordTextField.text isEqualToString:@""] )
        return;

    
    UserModel *userModel = [[UserModel alloc]initWithUserId:nil withRealName:self.usernameTextField.text withDisplayName:nil withEmailId:nil withMobileNumber:nil withPassword:self.passwordTextField.text withVerificationCode:nil withDateModel:nil withSignUpOption:0 withCityName:nil withCountry:nil withImageUrl:nil withUserName:nil withPostCount:0.0 withCommentsCount:0.0 withProfileViewsCount:0.0 withPostShareCount:0.0 withPostAnswerd:0.0 withFavoriteArticle:0.0 withFavoriteVideos:0.0 withTotalRecommendation:0.0 withTotalProfileLikes:0.0 withRatingStars:0.0 withArticleArray:nil withPostArray:nil withAge:0.0];
    
    JFWWebserviceManager *webServiceManager = [[JFWWebserviceManager alloc]init];
    
   [webServiceManager requestLoginApiWithLoginModal:userModel withSuccessBlock:^(id modal)
    {
        UserModel *userModel = (UserModel *)modal;
        NSLog(@"User name is %@",userModel.userName);

        [self handleLoginResponse:modal];
        NSLog(@"User name is %@",userModel.userName);
       
   } withFailureBlock:^(NSError *error)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"There is some problem in the server please try again" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:YES];
   }];
    

}

-(void)handleLoginResponse:(UserModel *)model
{
    [self pushHomeView];
}


-(void)pushHomeView
{
    IGHomeViewController *beaconSearchViewControllerObj = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    
    IGLeftMenuViewController *leftSideDrawerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LeftMenuViewController"];
    
    UIViewController * rightSideDrawerViewController = [[MMExampleRightSideDrawerViewController alloc] init];
    
    UINavigationController * navigationController = [[MMNavigationController alloc] initWithRootViewController:beaconSearchViewControllerObj];
    [navigationController setRestorationIdentifier:@"MMExampleCenterNavigationControllerRestorationKey"];
    if([JFWUtilities isOSVersionIsAtLeastiOS7]){
        UINavigationController * rightSideNavController = [[MMNavigationController alloc] initWithRootViewController:rightSideDrawerViewController];
        [rightSideNavController setRestorationIdentifier:@"MMExampleRightNavigationControllerRestorationKey"];
        //        UINavigationController * leftSideNavController = [[MMNavigationController alloc] initWithRootViewController:leftSideDrawerViewController];
        //        [leftSideNavController setRestorationIdentifier:@"MMExampleLeftNavigationControllerRestorationKey"];
        self.drawerController = [[MMDrawerController alloc]
                                 initWithCenterViewController:navigationController
                                 leftDrawerViewController:leftSideDrawerViewController
                                 rightDrawerViewController:nil];
        [self.drawerController setShowsShadow:NO];
    }
    else{
        self.drawerController = [[MMDrawerController alloc]
                                 initWithCenterViewController:navigationController
                                 leftDrawerViewController:leftSideDrawerViewController
                                 rightDrawerViewController:rightSideDrawerViewController];
    }
    [self.drawerController setRestorationIdentifier:@"MMDrawer"];
    [self.drawerController setMaximumRightDrawerWidth:200.0];
    [self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    [self.drawerController
     setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
         MMDrawerControllerDrawerVisualStateBlock block;
         block = [[MMExampleDrawerVisualStateManager sharedManager]
                  drawerVisualStateBlockForDrawerSide:drawerSide];
         if(block){
             block(drawerController, drawerSide, percentVisible);
         }
     }];
    
    JFWAppDelegate *delegate = [[UIApplication sharedApplication]delegate];
    
    [delegate.window setRootViewController:self.drawerController];

}
- (IBAction)onFacebookButtonTapped:(id)sender
{
    
}

- (IBAction)onGooglePlusButtonTapped:(id)sender
{
     [socialManagerObj googlePlusLogin];
}

-(void)onGooglePlusLoginDoneWithData :(id)jsonResponseData withError:(NSError *)error
{
    if(!error)
    {
        NSString *userEmailId = (NSString *)jsonResponseData;
        
        NSLog(@"%@", userEmailId);
        
       
    }
    else
    {
        
    }
}



- (IBAction)onForgotPasswordButtonTapped:(id)sender
{
    viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"JFWForgotPasswordViewControllerId"];
    viewController.delegate = self;
    
    // [self addChildViewController:viewController];
    
    [viewController.view setFrame:CGRectMake(20, 240, 280, 173)];
    
    viewController.view.layer.cornerRadius = 5.0;
    viewController.view.layer.masksToBounds = YES;
    viewController.view.layer.borderWidth = 1.0;
    viewController.view.layer.borderColor = [UIColor whiteColor].CGColor;
    
    [self.view addSubview:viewController.view];
    
    [viewController didMoveToParentViewController:self];
}


- (void)onSubmitButtonTapped:(NSString *)password
{
    [viewController.view removeFromSuperview];

    
    JFWWebserviceManager *webServiceManager = [[JFWWebserviceManager alloc]init];
    
    [webServiceManager requestForgotPasswordApiWithPassword:password withSuccessBlock:^(id modal)
     {
        
         NSLog(@"User name is");
         [viewController.view removeFromSuperview];
         
     } withFailureBlock:^(NSError *error)
     {
         [viewController.view removeFromSuperview];

     }];
    
    
}

- (IBAction)onSignUpButtonTapped:(id)sender
{
     UIViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SignUpViewControllerIdentifier"];
    
    [self presentViewController:viewController animated:YES completion:nil];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//- (void)  loginButton:(FBSDKLoginButton *)loginButton
//didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
//                error:(NSError *)error
//{
//    [loginButton setDelegate:self];
//    UIImage *fbIconImage = [UIImage imageNamed:@"facebook_icon.png"];
//    loginButton.titleLabel.text = @"";
//    
//    loginButton.backgroundColor = [UIColor clearColor];
//    [loginButton setBackgroundImage:fbIconImage forState:UIControlStateNormal];
//
//    
//}
@end
