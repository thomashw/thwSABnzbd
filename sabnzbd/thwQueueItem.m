//
//  thwQueueItem.m
//  sabnzbd
//
//  Created by Thomas Hewton-Waters on 1/30/2014.
//  Copyright (c) 2014 thomashw. All rights reserved.
//

#import "thwQueueItem.h"
#import "thwDownloadStatus.h"

@implementation thwQueueItem

const NSString *FILE_NAME = @"filename";
const NSString *QUEUE = @"queue";
const NSString *SIZE = @"size";
const NSString *SLOTS = @"slots";
const NSString *STATUS = @"status";
const NSString *TIME_LEFT = @"timeleft";

+ (NSArray*) getItemsFromQueueDictionary:(NSDictionary*)dictionary
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSDictionary *queueDictionary = [dictionary objectForKey:QUEUE];
    NSArray *slotsArray = [queueDictionary objectForKey:SLOTS];
    
    for (NSDictionary *nzbDownload in slotsArray) {
        NSString *name = [nzbDownload objectForKey:FILE_NAME];
        NSString *size = [nzbDownload objectForKey:SIZE];
        NSString *status = [nzbDownload objectForKey:STATUS];
        NSString *timeLeft = [nzbDownload objectForKey:TIME_LEFT];
        thwDownloadStatus *downloadStatus = [[thwDownloadStatus alloc] initWithString:status];
        thwQueueItem *newItem = [[thwQueueItem alloc] initWithName:name size:size timeLeft:timeLeft downloadStatus:downloadStatus];
        [array addObject:newItem];
    }
    
    return array;
}

@end
