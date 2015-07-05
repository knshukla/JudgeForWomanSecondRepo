//
//  FilterManager.m
//  JUZ4Women
//
//  Created by Aakash sharma on 06/07/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "FilterManager.h"

#import "JFWFeedsModel.h"

@implementation FilterManager

+(NSMutableArray *)filterArray:(NSMutableArray *)dataArray WithFilter:(DataFilterType)filterType
{
    NSString *key;
    NSMutableArray *sortedAray;
    
    switch (filterType)
    {
        case kNewest:
            
            key = [self getKeyForModelNewest:[dataArray lastObject]];
            sortedAray = [self sortArray:dataArray onKey:key];
            
            break;
            
        case kMostLiked:
            
            key = [self getKeyForModelMostLiked:[dataArray lastObject]];
            sortedAray = [self sortArray:dataArray onKey:key];
            
            break;
            
        case kMostDislike:
            
            key = [self getKeyForModelMostDisliked:[dataArray lastObject]];
            sortedAray = [self sortArray:dataArray onKey:key];
            
            break;
            
        case kAdminPost:
            
            break;
            
        case kPostOfTheDay:
            
            key = [self getKeyForModelPostOfTheDay:[dataArray lastObject]];
            sortedAray = [self sortArray:dataArray onKey:key];
            
            break;
            
        default:
            break;
    }
    
    return sortedAray;
}

+(NSMutableArray *)sortArray:(NSMutableArray *)dataArray onKey:(NSString *)key
{
    if (!dataArray || !key) {
        return nil;
    }
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:key
                                                 ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSMutableArray *sortedArray = [[dataArray sortedArrayUsingDescriptors:sortDescriptors] mutableCopy];
    
    return sortedArray;
}

+(NSString *)getKeyForModelNewest:(id)modelObj
{
    if (!modelObj) {
        return nil;
    }
    
    if ([modelObj isKindOfClass:[JFWFeedsModel class]])
    {
        return @"postDate";
    }
    
    return nil;
}

+(NSString *)getKeyForModelMostLiked:(id)modelObj
{
    if (!modelObj) {
        return nil;
    }
    
    if ([modelObj isKindOfClass:[JFWFeedsModel class]])
    {
        return @"likeCount";
    }
    
    return nil;
}


+(NSString *)getKeyForModelMostDisliked:(id)modelObj
{
    if (!modelObj) {
        return nil;
    }
    
    if ([modelObj isKindOfClass:[JFWFeedsModel class]])
    {
        return @"dislikeCount";
    }
    
    return nil;
}


//+(NSString *)getKeyForModelAdminPost:(id)modelObj
//{
//    if (!modelObj) {
//        return nil;
//    }
//    
//    if ([modelObj isKindOfClass:[JFWFeedsModel class]])
//    {
//        return @"postDate";
//    }
//    
//    return nil;
//}

+(NSString *)getKeyForModelPostOfTheDay:(id)modelObj
{
    if (!modelObj) {
        return nil;
    }
    
    if ([modelObj isKindOfClass:[JFWFeedsModel class]])
    {
        return @"postDate";
    }
    
    return nil;
}
@end
