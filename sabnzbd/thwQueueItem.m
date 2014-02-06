//
//  thwQueueItem.m
//  sabnzbd
//
//  Created by Thomas Hewton-Waters on 1/30/2014.
//  Copyright (c) 2014 thomashw. All rights reserved.
//

#import "thwQueueItem.h"

@implementation thwQueueItem

+ (NSArray*) getItemsFromQueueDictionary:(NSDictionary*)dictionary
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSDictionary *queueDictionary = [dictionary objectForKey:@"queue"];
    NSArray *slotsArray = [queueDictionary objectForKey:@"slots"];
    
    for (NSDictionary *nzbDownload in slotsArray) {
        thwQueueItem *newItem = [[thwQueueItem alloc] init];
        [newItem setName:[nzbDownload objectForKey:@"filename"]];
        [newItem setSize:[nzbDownload objectForKey:@"size"]];
        [newItem setStatus:[nzbDownload objectForKey:@"status"]];
        [newItem setTimeLeft:[nzbDownload objectForKey:@"timeleft"]];
        [array addObject:newItem];
    }
    
    return array;
}

@end
