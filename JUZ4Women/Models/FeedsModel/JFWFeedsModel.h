//
//  JFWFeedsModel.h
//  JUZ4Women
//
//  Created by Kailash on 6/13/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JFWFeedsModel : NSObject

@property (nonatomic) NSNumber *postId;
@property (nonatomic) NSNumber *likeCount;
@property (nonatomic) NSNumber *dislikeCount;
@property (nonatomic) NSNumber *commentsCount;
@property (nonatomic) NSString *postTitle;
@property (nonatomic) NSString *tags;

-(id)initWithPostId:(NSNumber *)postId withLikeCount:(NSNumber *)likeCount withDislikeCount:(NSNumber *)dislikeCount withcommentsCount:(NSNumber *)commentsCount withPostTitle:(NSString *)postTitle withTags:(NSString *)postTitle;
@end
