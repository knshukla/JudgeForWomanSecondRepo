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
#import "JFWAppConstants.h"
#import "JFWUtilities.h"

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
    
    [self setDataOnTimeLabel:feedModel];
    
    
    //NSString *defaultImage = kDefaultLiveEventPlaceholderImage;
    NSString *finalUrl = [NSString stringWithFormat:@"%@/%@",kBaseUrl,feedModel.userAvatorUrl];
    NSMutableURLRequest *imageRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:finalUrl]];
    [self.userImageView setImageWithURLRequest:imageRequest placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image)
     {
         [self.userImageView setImage:image];
         
     }failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error)
     {
         
     }];
}

-(void)setDataOnTimeLabel:(JFWFeedsModel *)feedModel
{
    NSDate *date = [JFWUtilities getDateFromDate:feedModel.postDate andTime:feedModel.postTime];
    
    [self.postDateTimeLabel setText:[JFWUtilities relativeDateStringForDate:date]];
}

@end
