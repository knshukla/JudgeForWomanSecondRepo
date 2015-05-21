//
//  JFWNotificationCell.h
//  JUZ4Women
//
//  Created by Kailash on 5/17/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFWNotificationCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *notifiedByImageView;

@property (weak, nonatomic) IBOutlet UILabel *notificationTitleLabel;

@property (weak, nonatomic) IBOutlet UIImageView *notificationIconImageView;


@property (weak, nonatomic) IBOutlet UILabel *notificationTimeLabel;

@end
