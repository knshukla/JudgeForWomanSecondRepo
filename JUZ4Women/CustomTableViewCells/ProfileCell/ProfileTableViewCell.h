//
//  ProfileTableViewCell.h
//  JUZ4Women
//
//  Created by Kailash on 6/19/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JFWAppConstants.h"

@class ArticleModel;
@class JFWFeedsModel;

@protocol ProfileTableViewCellDelegate <NSObject>

-(void)likeInspiredButtonTapped:(ArticleModel *)articleModel andValue:(LikeInspiredValue)inspiredValue;

@end

@interface ProfileTableViewCell : UITableViewCell
{
    ArticleModel * articleModelObj;
}
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *tagLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet UILabel *likeLabel;

@property (weak, nonatomic) IBOutlet UILabel *disLikeLabel;

@property (weak, nonatomic) IBOutlet UILabel *commentsLabel;

@property (nonatomic, weak) id <ProfileTableViewCellDelegate> delegate;

- (IBAction)onLikedButtonTapped:(id)sender;

- (IBAction)onDislikeButtonTapped:(id)sender;

- (IBAction)onCommentButtonTapped:(id)sender;

- (IBAction)onShareButtonTapped:(id)sender;

-(void)configureCellWithArticleModel:(ArticleModel *)articleModel;
-(void)configureCellWithFeedModel:(JFWFeedsModel *)feedModel;

@end
