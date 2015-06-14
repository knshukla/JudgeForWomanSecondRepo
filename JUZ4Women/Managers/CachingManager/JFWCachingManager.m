//
//  MFCachingManager.m
//  MediaFoundryMobileApp
//
//  Created by Kailash on 4/19/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "JFWCachingManager.h"
static JFWCachingManager *sharedInstance = nil;

@implementation JFWCachingManager

#pragma mark singleton class method
+ (JFWCachingManager *) getInstance
{
    @synchronized(self)
    {
        if(sharedInstance == nil)
        {
            sharedInstance = [[self alloc] init];
        }
    }
    
    return sharedInstance;
}
+ (void) removeInstance
{
    @synchronized(self)
    {
        if(sharedInstance != nil)
        {
            sharedInstance = nil;
            if(sharedInstance == nil)
            {
                NSLog(@"Singleton removed");
            }
        }
    }
}

+ (id) allocWithZone:(NSZone*)zone
{
    @synchronized(self)
    {
        if(sharedInstance == nil)
        {
            sharedInstance = [super allocWithZone:zone];
            return sharedInstance;
        }
    }
    return nil;
}

- (id) init
{
    self = [super init];
    
    if (self != nil)
    {
        
    }
    return self;
}

- (id)copyWithZone:(NSZone*)zone
{
    return self;
}


@end
