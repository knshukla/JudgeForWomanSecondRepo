//
//  JFWFeedsModel.m
//  JUZ4Women
//
//  Created by Kailash on 6/13/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "JFWFeedsModel.h"

@implementation JFWFeedsModel

-(id)initWithPostId:(int )postId withLikeCount:(long)likeCount withDislikeCount:(long)dislikeCount withcommentsCount:(long)commentsCount withPostTitle:(NSString *)postTitle withTags:(NSString *)tags withUserAvatorUrl:(NSString *)avatorUrl
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
        self.userAvatorUrl = avatorUrl;
    }
    return self;
}

@end
