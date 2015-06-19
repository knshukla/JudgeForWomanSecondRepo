//
//  FilterViewController.h
//  JUZ4Women
//
//  Created by Kailash on 6/18/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JFWAppConstants.h"

@protocol FilterDelegate

- (void)onCancelButtonTapped;

@end

@interface FilterViewController : UIViewController

- (IBAction)onCancelButtonTapped:(id)sender;

@property (nonatomic) id <FilterDelegate> delegate;
@property (assign) FilterType filterType;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewHeightConstraints;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
