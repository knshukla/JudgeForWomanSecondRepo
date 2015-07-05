//
//  SearchViewCell.h
//  JUZ4Women
//
//  Created by Kailash on 17/05/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewCell : UITableViewCell
{
    __weak IBOutlet UIImageView *userImageView;
    __weak IBOutlet UILabel *titleLLabel;
    __weak IBOutlet UILabel *subTitleLabel;
    __weak IBOutlet UILabel *daysAgoLabel;
    
    __weak IBOutlet UILabel *likeLabel;
    __weak IBOutlet UILabel *disLikeLabel;
    __weak IBOutlet UILabel *commentLabel;
}

- (IBAction)shareButtonTapped:(id)sender;
@end
