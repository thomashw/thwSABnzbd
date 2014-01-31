//
//  thwHistoryItem.m
//  sabnzbd
//
//  Created by Thomas Hewton-Waters on 1/29/2014.
//  Copyright (c) 2014 thomashw. All rights reserved.
//

#import "thwHistoryItem.h"

@implementation thwHistoryItem

+ (NSArray*) getItemsFromHistoryDictionary:(NSDictionary*)dictionary
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSDictionary *historyDictionary = [dictionary objectForKey:@"history"];
    NSArray *slotsArray = [historyDictionary objectForKey:@"slots"];

    for (NSDictionary *nzbDownload in slotsArray) {
        thwHistoryItem *newItem = [[thwHistoryItem alloc] init];
        [newItem setName:[nzbDownload objectForKey:@"name"]];
        [newItem setSize:[nzbDownload objectForKey:@"size"]];
        [array addObject:newItem];
    }

    return array;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"name: %@, size: %@", self.name, self.size];
}

@end
