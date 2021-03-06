//
//  ProfileTableViewCell.m
//  JUZ4Women
//
//  Created by Kailash on 6/19/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "HomeDescriptionCell.h"
#import "ProfileTableViewCell.h"
#import "JFWFeedsModel.h"
#import "ArticleModel.h"
#import "UIImageView+AFNetworking.h"


@implementation HomeDescriptionCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)onLikedButtonTapped:(id)sender
{
    NSLog(@"like button tapped");
    
    if ([self.delegate respondsToSelector:@selector(likeInspiredButtonTapped:andValue:)])
    {
        [self.delegate likeInspiredButtonTapped:articleModelObj andValue:Inspired];
    }
}

- (IBAction)onDislikeButtonTapped:(id)sender
{
    NSLog(@"Dislike button tapped");

}

- (IBAction)onCommentButtonTapped:(id)sender {
}

- (IBAction)onShareButtonTapped:(id)sender {
}

-(void)configureCellWithArticleModel:(ArticleModel *)articleModel
{
    self.titleLabel.text = articleModel.ArticleTitle;
    self.tagLabel.text = articleModel.articleTags;
    
    NSString *finalUrl = [NSString stringWithFormat:@"%@/%@",kBaseUrl,articleModel.userThumbnailUrl];
    NSMutableURLRequest *imageRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:finalUrl]];
    [self.profileImageView setImageWithURLRequest:imageRequest placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image)
     {
         [self.profileImageView setImage:image];
         
     }failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error)
     {
         
     }];

}
-(void)configureCellWithFeedModel:(JFWFeedsModel *)feedModel
{
    self.titleLabel.text = feedModel.postTitle;
    self.tagLabel.text = feedModel.tags;
    
    NSString *finalUrl = [NSString stringWithFormat:@"%@/%@",kBaseUrl,feedModel.userAvatorUrl];
    NSMutableURLRequest *imageRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:finalUrl]];
    [self.profileImageView setImageWithURLRequest:imageRequest placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image)
     {
         [self.profileImageView setImage:image];
         
     }failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error)
     {
         
     }];

}
@end
