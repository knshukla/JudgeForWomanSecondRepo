//
//  VideoModel.h
//  JUZ4Women
//
//  Created by Kailash on 6/15/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoModel : NSObject

@property (nonatomic) NSString *videoName;
@property (nonatomic) NSString *videoUrl;
@property (nonatomic) NSString *videoTags;
@property (nonatomic) NSString *videoDescription;
@property (nonatomic) NSString *videoThumbnailUrl;


@property (assign) long videoLikes;
@property (assign) long videoInspire;
@property (assign) int videoId;

-(id)initWithVideoName:(NSString *)videoName withVideoUrl:(NSString *)videoUrl withVideoTags:(NSString *)videoTags withVideoLikes:(long)videoLikes withVideoInspires:(long)videoInspires withVideoId:(int)videoId withDescription:(NSString *)description withThumbnailUrl:(NSString *)url;

@end
