//
//  IGHomeViewCellTableViewCell.m
//  IGBeacon
//
//  Created by Kailash on 1/6/15.
//  Copyright (c) 2015 IG. All rights reserved.
//

#import "IGHomeViewCellTableViewCell.h"

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

@end
