//
//  PostDescriptionViewController.h
//  JUZ4Women
//
//  Created by Kailash on 6/20/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFWFeedsModel;
@interface PostDescriptionViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;

@property (weak, nonatomic) IBOutlet UILabel *postTitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *postTimeLabel;

@property (weak, nonatomic) IBOutlet UILabel *postTags;

@property (weak, nonatomic) IBOutlet UITextView *postDescriptionTextView;

- (IBAction)onLikeButtonTapped:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *likeCountLabel;
- (IBAction)onDislikeButtonTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *dislikeCountLabel;

- (IBAction)onCommentButtonTapped:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *commentCountLabel;

- (IBAction)onBlockButtonTapped:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *blockCountLabel;

- (IBAction)onUploadButtonTapped:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *tableViewObj;

@property (weak, nonatomic) IBOutlet UITextView *postTextViewObj;

- (IBAction)onPostButtonTapped:(id)sender;

@property (nonatomic,strong)JFWFeedsModel *feedModel;

@end
