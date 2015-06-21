//
//  ProfileTableViewCell.h
//  JUZ4Women
//
//  Created by Kailash on 6/19/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ArticleModel;
@class JFWFeedsModel;

@interface ProfileTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *tagLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet UILabel *likeLabel;

@property (weak, nonatomic) IBOutlet UILabel *disLikeLabel;

@property (weak, nonatomic) IBOutlet UILabel *commentsLabel;


- (IBAction)onLikedButtonTapped:(id)sender;

- (IBAction)onDislikeButtonTapped:(id)sender;

- (IBAction)onCommentButtonTapped:(id)sender;

- (IBAction)onShareButtonTapped:(id)sender;

-(void)configureCellWithArticleModel:(ArticleModel *)articleModel;
-(void)configureCellWithFeedModel:(JFWFeedsModel *)feedModel;

@end
