//
//  JFWVideoCell.h
//  JUZ4Women
//
//  Created by Kailash on 5/17/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JFWAppConstants.h"

@class VideoModel;

@protocol VideoCellDelegate <NSObject>

-(void)likeInspiredButtonTapped:(VideoModel *)videoModel andValue:(LikeInspiredValue)inspiredValue;

@end

@interface JFWVideoCell : UITableViewCell
{
    VideoModel *videoModelObj;
}

@property (weak, nonatomic) IBOutlet UILabel *videoName;
@property (weak, nonatomic) IBOutlet UILabel *videoTags;
@property (weak, nonatomic) IBOutlet UILabel *likesLabel;
@property (weak, nonatomic) IBOutlet UIImageView *videoImageView;

@property (weak, nonatomic) IBOutlet UILabel *inspireLabel;


@property (weak, nonatomic) IBOutlet UILabel *videoTime;

@property(nonatomic,weak) id <VideoCellDelegate> delegate;

-(void)configureCellWithModel:(VideoModel *)videoModel;

- (IBAction)inspiredButtonTapped:(id)sender;
- (IBAction)likeButtonTapped:(id)sender;

@end
