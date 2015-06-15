//
//  VideoModel.m
//  JUZ4Women
//
//  Created by Kailash on 6/15/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel

-(id)initWithVideoName:(NSString *)videoName withVideoUrl:(NSString *)videoUrl withVideoTags:(NSString *)videoTags withVideoLikes:(long)videoLikes withVideoInspires:(long)videoInspires withVideoId:(int)videoId withDescription:(NSString *)description withThumbnailUrl:(NSString *)url
{
    self = [super init];
    if(self)
    {
        self.videoId = videoId;
        self.videoName = videoName;
        self.videoTags = videoTags;
        self.videoUrl = videoUrl;
        self.videoLikes = videoLikes;
        self.videoInspire = videoInspires;
        self.videoDescription = description;
        self.videoThumbnailUrl = url;
    }
    return self;
}


@end
