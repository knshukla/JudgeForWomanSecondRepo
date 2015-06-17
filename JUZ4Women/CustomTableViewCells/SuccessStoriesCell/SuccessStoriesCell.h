//
//  SuccessStoriesCell.h
//  JUZ4Women
//
//  Created by Kailash on 5/17/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ArticleModel;

@interface SuccessStoriesCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *userImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *tagsLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLable;

-(void)configureCellWithModel:(ArticleModel *)articleModel;

@end
