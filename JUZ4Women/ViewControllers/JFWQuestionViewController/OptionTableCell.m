//
//  OptionTableCell.m
//  JUZ4Women
//
//  Created by Gautam Arora on 13/06/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "OptionTableCell.h"
#import "OptionModel.h"

@implementation OptionTableCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setDataOnCell :(OptionModel *)optionModelObj
{
    if(!optionModelObj)
        return;
    
    optionLabel.text = optionModelObj.optionText;
    if(optionModelObj.isOptionSelected)
        [selectionImage setBackgroundColor:[UIColor colorWithRed:228/255.0 green:95/255.0 blue:153/255.0 alpha:1]];
    else
        [selectionImage setBackgroundColor:[UIColor clearColor]];
    
}

@end
