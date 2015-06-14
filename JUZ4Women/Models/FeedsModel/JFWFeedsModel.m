//
//  JFWFeedsModel.m
//  JUZ4Women
//
//  Created by Kailash on 6/13/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "JFWFeedsModel.h"

@implementation JFWFeedsModel

-(id)initWithPostId:(NSNumber *)postId withLikeCount:(NSNumber *)likeCount withDislikeCount:(NSNumber *)dislikeCount withcommentsCount:(NSNumber *)commentsCount withPostTitle:(NSString *)postTitle withTags:(NSString *)tags
{
    self = [super init];
    if(self)
    {
        self.postId = postId;
        self.likeCount = likeCount;
        self.dislikeCount = dislikeCount;
        self.commentsCount = commentsCount;
        self.postTitle = postTitle;
        self.tags = tags;
    }
    return self;
}

@end
