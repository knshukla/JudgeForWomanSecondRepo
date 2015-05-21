//
//  AppDelegate.m
//  JUZ4Women
//
//  Created by Kailash on 4/29/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "JFWAppDelegate.h"
#import "IGLeftMenuViewController.h"
#import "IGRightMenuViewController.h"
#import "IGHomeViewController.h"
#import "MMDrawerController.h"
#import "MMExampleCenterTableViewController.h"
#import "MMExampleLeftSideDrawerViewController.h"
#import "MMExampleRightSideDrawerViewController.h"
#import "MMDrawerVisualState.h"
#import "MMExampleDrawerVisualStateManager.h"
#import "MMNavigationController.h"
#import "JFWLoginViewController.h"
#import "UserPreference.h"
#import "JFWAppConstants.h"

static BOOL OSVersionIsAtLeastiOS7() {
    return (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1);
}


@interface JFWAppDelegate ()

@property (nonatomic,strong) MMDrawerController * drawerController;

@end

@implementation JFWAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
        
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kUserLoggedInKey];
    UIStoryboard *mainStoryboardObj = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    if([[UserPreference sharedInstance] isUserLoggedin])
    {
        UIViewController *viewController = [mainStoryboardObj instantiateViewControllerWithIdentifier:@"JFWLoginViewControllerId"];
        self.window.rootViewController = viewController;
    }
    else
    {
        IGHomeViewController *beaconSearchViewControllerObj = [mainStoryboardObj instantiateViewControllerWithIdentifier:@"HomeViewController"];
        
        IGLeftMenuViewController *leftSideDrawerViewController = [mainStoryboardObj instantiateViewControllerWithIdentifier:@"LeftMenuViewController"];
        
        UIViewController * rightSideDrawerViewController = [[MMExampleRightSideDrawerViewController alloc] init];
        
        UINavigationController * navigationController = [[MMNavigationController alloc] initWithRootViewController:beaconSearchViewControllerObj];
        [navigationController setRestorationIdentifier:@"MMExampleCenterNavigationControllerRestorationKey"];
        if(OSVersionIsAtLeastiOS7()){
            UINavigationController * rightSideNavController = [[MMNavigationController alloc] initWithRootViewController:rightSideDrawerViewController];
            [rightSideNavController setRestorationIdentifier:@"MMExampleRightNavigationControllerRestorationKey"];
           
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
        
        //    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        
        if(OSVersionIsAtLeastiOS7()){
            UIColor * tintColor = [UIColor colorWithRed:29.0/255.0
                                                  green:173.0/255.0
                                                   blue:234.0/255.0
                                                  alpha:1.0];
            //[self.window setTintColor:tintColor];
        }
        [self.window setRootViewController:self.drawerController];
        
    }
    
    [self.window makeKeyAndVisible];
    
    [self configureNavigationDrawer];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

-(void)configureNavigationDrawer
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"
                                                             bundle: nil];
    
    IGLeftMenuViewController *leftMenu = (IGLeftMenuViewController*)[mainStoryboard
                                                                     instantiateViewControllerWithIdentifier: @"LeftMenuViewController"];
    
    IGRightMenuViewController *rightMenu = (IGRightMenuViewController*)[mainStoryboard
                                                                        instantiateViewControllerWithIdentifier: @"RightMenuViewController"];
    
    [SlideNavigationController sharedInstance].rightMenu = rightMenu;
    [SlideNavigationController sharedInstance].leftMenu = leftMenu;
    
    // Creating a custom bar button for right menu
    UIButton *button  = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [button setImage:[UIImage imageNamed:@"column_icon"] forState:UIControlStateNormal];
    [button addTarget:[SlideNavigationController sharedInstance] action:@selector(toggleRightMenu) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [SlideNavigationController sharedInstance].rightBarButtonItem = rightBarButtonItem;
    
    [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidClose object:nil queue:nil usingBlock:^(NSNotification *note) {
        NSString *menu = note.userInfo[@"menu"];
        NSLog(@"Closed %@", menu);
    }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidOpen object:nil queue:nil usingBlock:^(NSNotification *note)
     {
         NSString *menu = note.userInfo[@"menu"];
         NSLog(@"Opened %@", menu);
     }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidReveal object:nil queue:nil usingBlock:^(NSNotification *note) {
        NSString *menu = note.userInfo[@"menu"];
        NSLog(@"Revealed %@", menu);
    }];

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
