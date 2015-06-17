//
//  ArticleModel.h
//  JUZ4Women
//
//  Created by Kailash on 6/16/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArticleModel : NSObject

@property (nonatomic) NSString *ArticleTitle;
@property (nonatomic) NSString *articleDate;
@property (nonatomic) NSString *articleTime;

@property (nonatomic) NSString *articleConclusion;
@property (nonatomic) NSString *articleDescription;
@property (nonatomic) NSString *userThumbnailUrl;
@property (nonatomic) NSString *articleTags;


@property (assign) long articleLikes;
@property (assign) long articleInspired;
@property (assign) long postNumberComment;
@property (assign) int articleId;


-(id)initWithArticleTitle:(NSString *)articleTitle withDate:(NSString *)articleDate withArticleTags:(NSString *)articleTags withArticleLikes:(long)articleLikes withArticleInspires:(long)articleInspires withAritcleId:(int)articleId withDescription:(NSString *)description withThumbnailUrl:(NSString *)url withConclusion:(NSString *)conclusion withPostComment:(long)postComment withTime:(NSString *)aritcleTime;

@end
