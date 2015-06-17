//
//  SuccessStoriesCell.m
//  JUZ4Women
//
//  Created by Kailash on 5/17/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "SuccessStoriesCell.h"
#import "ArticleModel.h"
#import "UIImageView+AFNetworking.h"
#import "JFWAppConstants.h"

@implementation SuccessStoriesCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureCellWithModel:(ArticleModel *)articleModel
{
    self.titleLable.text = articleModel.ArticleTitle;
    self.tagsLabel.text = articleModel.articleTags;
    
    NSString *finalUrl = [NSString stringWithFormat:@"%@/%@",kBaseUrl,articleModel.userThumbnailUrl];
    NSMutableURLRequest *imageRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:finalUrl]];
    [self.userImageView setImageWithURLRequest:imageRequest placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image)
     {
         [self.userImageView setImage:image];
         
     }failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error)
     {
         
     }];

}

@end
