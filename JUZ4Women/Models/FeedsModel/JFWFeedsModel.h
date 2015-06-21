//
//  JFWFeedsModel.h
//  JUZ4Women
//
//  Created by Kailash on 6/13/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JFWFeedsModel : NSObject

@property (assign) int postId;
@property (assign) long likeCount;
@property (assign) long dislikeCount;
@property (assign) long commentsCount;
@property (nonatomic,strong) NSString *postTitle;
@property (nonatomic,strong) NSString *userAvatorUrl;

@property (nonatomic,strong) NSString *tags;
@property (nonatomic,strong) NSString *tag1;
@property (nonatomic,strong) NSString *tag2;
@property (nonatomic,strong) NSString *tag3;
@property (nonatomic,strong) NSString *postDescription;
@property (nonatomic,strong) NSString *postDate;
@property (nonatomic,strong) NSString *postTime;



-(id)initWithPostId:(int )postId withLikeCount:(long)likeCount withDislikeCount:(long)dislikeCount withcommentsCount:(long)commentsCount withPostTitle:(NSString *)postTitle withTags:(NSString *)tags withUserAvatorUrl:(NSString *)avatorUrl withTag1:(NSString *)tag1 withTag2:(NSString *)tag2 withTag3:(NSString *)tag3 withPostDescription:(NSString *)postDescription withPostDate:(NSString *)postDate withPostTime:(NSString *)postTime;
@end
