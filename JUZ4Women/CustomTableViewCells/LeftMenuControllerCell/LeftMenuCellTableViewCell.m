//
//  LeftMenuCellTableViewCell.m
//  IGBeacon
//
//  Created by Kailash on 1/19/15.
//  Copyright (c) 2015 IG. All rights reserved.
//

#import "LeftMenuCellTableViewCell.h"
#import "JFWMenuItemModel.h"


@implementation LeftMenuCellTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureCellWith:(JFWMenuItemModel *)modelObj;
{
    self.menuItemName.text = modelObj.menuItemName;
    
    self.menuItemImageView.image = [UIImage imageNamed:modelObj.menuItemImageName];
    
}

@end
