//
//  JFWArticleViewController.h
//  JUZ4Women
//
//  Created by Kailash on 5/3/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFWProfileViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *profileTableView;

@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;

- (IBAction)onProfileEditButtonTapped:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *postCountLabel;


@property (weak, nonatomic) IBOutlet UILabel *postAnswerdCountLabel;


@property (weak, nonatomic) IBOutlet UILabel *favoritArticleCountLabel;

@property (weak, nonatomic) IBOutlet UILabel *favoriteVideoCountLabel;

@end
