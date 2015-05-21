//
//  LeftMenuCellTableViewCell.h
//  IGBeacon
//
//  Created by Kailash on 1/19/15.
//  Copyright (c) 2015 IG. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFWMenuItemModel;
@interface LeftMenuCellTableViewCell : UITableViewCell

@property (nonatomic) IBOutlet UIImageView *menuItemImageView;
@property (nonatomic) IBOutlet UILabel *menuItemName;

@property (weak, nonatomic) IBOutlet UIImageView *borderImageView;

-(void)configureCellWith:(JFWMenuItemModel *)modelObj;
@end
