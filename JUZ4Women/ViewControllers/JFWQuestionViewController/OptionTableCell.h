//
//  OptionTableCell.h
//  JUZ4Women
//
//  Created by Gautam Arora on 13/06/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <UIKit/UIKit.h>
@class OptionModel;

@interface OptionTableCell : UITableViewCell
{
    
    __weak IBOutlet UILabel *optionLabel;
    __weak IBOutlet UIImageView *selectionImage;
}

-(void)setDataOnCell :(OptionModel *)optionModelObj;

@end
