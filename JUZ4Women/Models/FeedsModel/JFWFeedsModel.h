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
@property (nonatomic) NSString *postTitle;
@property (nonatomic) NSString *userAvatorUrl;

@property (nonatomic) NSString *tags;

-(id)initWithPostId:(int )postId withLikeCount:(long)likeCount withDislikeCount:(long)dislikeCount withcommentsCount:(long)commentsCount withPostTitle:(NSString *)postTitle withTags:(NSString *)tags withUserAvatorUrl:(NSString *)avatorUrl;
@end
