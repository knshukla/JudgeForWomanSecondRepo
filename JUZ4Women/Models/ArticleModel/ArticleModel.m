//
//  ArticleModel.m
//  JUZ4Women
//
//  Created by Kailash on 6/16/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "ArticleModel.h"

@implementation ArticleModel

-(id)initWithArticleTitle:(NSString *)articleTitle withDate:(NSString *)articleDate withArticleTags:(NSString *)articleTags withArticleLikes:(long)articleLikes withArticleInspires:(long)articleInspires withAritcleId:(int)articleId withDescription:(NSString *)description withThumbnailUrl:(NSString *)url withConclusion:(NSString *)conclusion withPostComment:(long)postComment withTime:(NSString *)aritcleTime
{
    self = [super init];
    if(self)
    {
        self.articleId = articleId;
        self.ArticleTitle = articleTitle;
        self.articleTags = articleTags;
        self.userThumbnailUrl = url;
        self.articleLikes = articleLikes;
        self.articleInspired = articleInspires;
        self.postNumberComment = postComment;
        self.articleDescription = description;
        self.articleConclusion = conclusion;
        self.articleDate = articleDate;
        self.articleTime = aritcleTime;

    }
    return self;
}

@end
