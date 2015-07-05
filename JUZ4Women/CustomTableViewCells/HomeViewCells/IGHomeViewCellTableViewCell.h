//
//  IGHomeViewCellTableViewCell.h
//  IGBeacon
//
//  Created by Kailash on 1/6/15.
//  Copyright (c) 2015 IG. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFWFeedsModel;
@interface IGHomeViewCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *postTitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *postTitleDescriptionLabel;


@property (weak, nonatomic) IBOutlet UIImageView *userImageView;

-(void)configureCell:(JFWFeedsModel *)feedModel;


@property (weak, nonatomic) IBOutlet UILabel *postDateTimeLabel;

@end
