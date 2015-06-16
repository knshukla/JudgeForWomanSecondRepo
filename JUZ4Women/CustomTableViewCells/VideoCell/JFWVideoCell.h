//
//  JFWVideoCell.h
//  JUZ4Women
//
//  Created by Kailash on 5/17/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <UIKit/UIKit.h>
@class VideoModel;
@interface JFWVideoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *videoName;
@property (weak, nonatomic) IBOutlet UILabel *videoTags;
@property (weak, nonatomic) IBOutlet UILabel *likesLabel;
@property (weak, nonatomic) IBOutlet UIImageView *videoImageView;

@property (weak, nonatomic) IBOutlet UILabel *inspireLabel;


@property (weak, nonatomic) IBOutlet UILabel *videoTime;


-(void)configureCellWithModel:(VideoModel *)videoModel;
@end
