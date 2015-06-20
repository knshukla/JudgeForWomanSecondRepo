//
//  JFWLegalAdviceCell.h
//  JUZ4Women
//
//  Created by Kailash on 5/17/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ArticleModel;
@interface JFWLegalAdviceCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *userProfileImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *tagLabel;

@property (weak, nonatomic) IBOutlet UILabel *dateLable;

-(void)configureCellWithModel:(ArticleModel *)articleModel;

@end
