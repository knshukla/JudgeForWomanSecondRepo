//
//  MFCachingManager.h
//  MediaFoundryMobileApp
//
//  Created by Kailash on 4/19/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MFMediaModal;

@interface MFCachingManager : NSObject

@property (nonatomic ,strong) NSMutableArray *mediaListingArray;
@property (nonatomic ,strong) MFMediaModal *mediaModalObj;


+ (MFCachingManager *) getInstance;
+ (void) removeInstance;
@end
