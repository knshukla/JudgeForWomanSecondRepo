//
//  JFWFeedsModel.m
//  JUZ4Women
//
//  Created by Kailash on 6/13/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "JFWFeedsModel.h"

@implementation JFWFeedsModel

-(id)initWithPostId:(int )postId withLikeCount:(long)likeCount withDislikeCount:(long)dislikeCount withcommentsCount:(long)commentsCount withPostTitle:(NSString *)postTitle withTags:(NSString *)tags withUserAvatorUrl:(NSString *)avatorUrl withTag1:(NSString *)tag1 withTag2:(NSString *)tag2 withTag3:(NSString *)tag3 withPostDescription:(NSString *)postDescription withPostDate:(NSString *)postDate withPostTime:(NSString *)postTime
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
        self.tag1 = tag1;
        self.tag2 = tag2;
        self.tag3 = tag3;
        self.postDescription = postDescription;
        self.postDate = postDate;
        self.postTime = postTime;
    }
    return self;
}

@end
