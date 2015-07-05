//
//  JFWVideoCell.m
//  JUZ4Women
//
//  Created by Kailash on 5/17/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "JFWVideoCell.h"
#import "VideoModel.h"
#import "UIImageView+AFNetworking.h"

@implementation JFWVideoCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureCellWithModel:(VideoModel *)videoModel;
{
    if(videoModel.isLikedVideo)
    {
        self.likeImageview.image = [UIImage imageNamed:@"like_medium_icon_selected.png"];
        
    }
    else
    {
        self.likeImageview.image = [UIImage imageNamed:@"like_medium_icon.png"];
    }
    
    if(videoModel.isInspiredVideo)
    {
        self.inspiredImageView.image = [UIImage imageNamed:@"inspried_medium_icon_selected.png"];
        
    }
    else
    {
        self.inspiredImageView.image = [UIImage imageNamed:@"inspried_medium_icon.png"];
    }
    videoModelObj = videoModel;
    
    NSString *likeString = [NSString stringWithFormat:@"%ld",videoModel.videoLikes];
    NSString *inspireString = [NSString stringWithFormat:@"%ld",videoModel.videoInspire];

    self.videoName.text = videoModel.videoName;
    self.videoTags.text = videoModel.videoTags;
    self.likesLabel.text = likeString;
    self.inspireLabel.text = inspireString;

    
    NSMutableURLRequest *imageRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:videoModel.videoThumbnailUrl]];
    [self.videoImageView setImageWithURLRequest:imageRequest placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image)
     {
         [self.videoImageView setImage:image];
         
     }failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error)
     {
         
     }];

}

- (IBAction)inspiredButtonTapped:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(likeInspiredButtonTapped:andValue:)])
    {
        [self.delegate likeInspiredButtonTapped:videoModelObj andValue:Inspired];
    }
}

- (IBAction)likeButtonTapped:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(likeInspiredButtonTapped:andValue:)])
    {
        [self.delegate likeInspiredButtonTapped:videoModelObj andValue:Like];
    }
}
@end
