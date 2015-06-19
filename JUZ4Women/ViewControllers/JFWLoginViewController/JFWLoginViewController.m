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

@interface JFWLoginViewController ()<ForgetPasswordDelegate>
{

    JFWForgotPasswordViewController *viewController;

}
@property (nonatomic,strong) MMDrawerController * drawerController;
@end

@implementation JFWLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self configureStatusBar];
    [self configureTextField];
    [self configureScrollView];
}

-(void)configureScrollView
{
    self.scrollViewObj.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"app_back.png"]];
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
    UserModel *userModel = [[UserModel alloc]initWithUserId:nil withRealName:nil withDisplayName:nil withEmailId:nil withMobileNumber:nil withPassword:nil withVerificationCode:nil withDateModel:nil withSignUpOption:0 withCityName:nil withCountry:nil withImageUrl:nil withUserName:nil withPostCount:0.0 withCommentsCount:0.0 withProfileViewsCount:0.0 withPostShareCount:0.0];
    
    JFWWebserviceManager *webServiceManager = [[JFWWebserviceManager alloc]init];
    
   [webServiceManager requestLoginApiWithLoginModal:userModel withSuccessBlock:^(id modal)
    {
        UserModel *userModel = (UserModel *)modal;
        [self handleLoginResponse:modal];
        NSLog(@"User name is %@",userModel.userName);
       
   } withFailureBlock:^(NSError *error)
    {
       
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
    
}

- (IBAction)onForgotPasswordButtonTapped:(id)sender
{
    viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"JFWForgotPasswordViewControllerId"];
    viewController.delegate = self;
    
    // [self addChildViewController:viewController];
    
    [viewController.view setFrame:CGRectMake(20, 240, 280, 173)];
    
    viewController.view.layer.cornerRadius = 5.0;
    viewController.view.layer.masksToBounds = YES;
    
    [self.view addSubview:viewController.view];
    
    [viewController didMoveToParentViewController:self];
}


- (void)onSubmitButtonTapped:(NSString *)password
{
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
@end
