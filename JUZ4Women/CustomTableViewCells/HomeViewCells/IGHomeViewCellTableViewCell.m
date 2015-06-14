//
//  IGHomeViewCellTableViewCell.m
//  IGBeacon
//
//  Created by Kailash on 1/6/15.
//  Copyright (c) 2015 IG. All rights reserved.
//

#import "IGHomeViewCellTableViewCell.h"
#import "JFWFeedsModel.h"
#import "UIImageView+AFNetworking.h"
@implementation IGHomeViewCellTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.postTitleDescriptionLabel.preferredMaxLayoutWidth = 50;
    
    [super layoutSubviews];
}

-(void)configureCell:(JFWFeedsModel *)feedModel
{
    self.postTitleLabel.text = feedModel.postTitle;
    self.postTitleDescriptionLabel.text = feedModel.tags;
    
    
    //NSString *defaultImage = kDefaultLiveEventPlaceholderImage;
    NSMutableURLRequest *imageRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:feedModel.userAvatorUrl]];
    [self.userImageView setImageWithURLRequest:imageRequest placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image)
     {
         [self.userImageView setImage:image];
         
     }failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error)
     {
         
     }];
}

@end
