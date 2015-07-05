//
//  VideoDescriptionViewController.h
//  JUZ4Women
//
//  Created by Company on 26/06/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "YTPlayerView.h"

@class VideoModel;

@interface VideoDescriptionViewController : UIViewController <YTPlayerViewDelegate>
{
    
    __weak IBOutlet UILabel *inspireCountLabel;
    __weak IBOutlet UILabel *likesCountLabel;
    __weak IBOutlet UILabel *videoDescriptionLabel;
    __weak IBOutlet UILabel *videoTimeLabel;
    __weak IBOutlet UILabel *videoTagsLabel;
    __weak IBOutlet UILabel *videoNameLabel;
}
@property (weak, nonatomic) IBOutlet YTPlayerView *playerViewObj;

@property (strong,nonatomic)VideoModel *videoModelObj;

@end
