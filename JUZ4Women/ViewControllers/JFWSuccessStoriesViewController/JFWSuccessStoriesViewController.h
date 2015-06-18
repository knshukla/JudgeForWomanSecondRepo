//
//  JFWSuccessStoriesViewController.h
//  JUZ4Women
//
//  Created by Kailash on 5/16/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFWSuccessStoriesViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *searchBeaconImageView;
@property (nonatomic) UIBackgroundTaskIdentifier backgroundTask;
@property (nonatomic) UIWindow *statusWindow;

@property (weak, nonatomic) IBOutlet UITableView *successStoriesTableView;

@property (weak, nonatomic) IBOutlet UIView *postTopViewObj;

- (IBAction)onAddPostButtonTapped:(id)sender;

- (IBAction)onEditPostButtonTapped:(id)sender;

- (IBAction)onFilterButtonTapped:(id)sender;
@end
