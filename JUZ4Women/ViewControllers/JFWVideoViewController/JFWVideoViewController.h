//
//  JFWVideoViewController.h
//  JUZ4Women
//
//  Created by Kailash on 5/3/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFWVideoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *videoTableView;

- (IBAction)onAddVideoButtonTapped:(id)sender;

- (IBAction)onFilterButtonTapped:(id)sender;

@end
