//
//  HomeViewController.h
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"
#import "FilterViewController.h"

@interface IGHomeViewController : UIViewController <SlideNavigationControllerDelegate,UITableViewDataSource,UITableViewDelegate,FilterDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *searchBeaconImageView;
@property (nonatomic) UIBackgroundTaskIdentifier backgroundTask;
@property (nonatomic) UIWindow *statusWindow;

@property (weak, nonatomic) IBOutlet UITableView *homeTableView;

@property (weak, nonatomic) IBOutlet UIView *postTopViewObj;

- (IBAction)onAddPostButtonTapped:(id)sender;

- (IBAction)onEditPostButtonTapped:(id)sender;

- (IBAction)onFilterButtonTapped:(id)sender;


@end
