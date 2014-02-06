//
//  thwHistoryItem.m
//  sabnzbd
//
//  Created by Thomas Hewton-Waters on 1/29/2014.
//  Copyright (c) 2014 thomashw. All rights reserved.
//

#import "thwHistoryItem.h"
#import "thwDownloadStatus.h"

@implementation thwHistoryItem

+ (NSArray*) getItemsFromHistoryDictionary:(NSDictionary*)dictionary
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSDictionary *historyDictionary = [dictionary objectForKey:@"history"];
    NSArray *slotsArray = [historyDictionary objectForKey:@"slots"];
    
    /*for (NSDictionary *nzbDownload in slotsArray) {
        NSString *name = [nzbDownload objectForKey:@"name"];
        NSString *size = [nzbDownload objectForKey:@"size"];
        NSString *status = [nzbDownload objectForKey:@"status"];
        thwDownloadStatus *downloadStatus = [[thwDownloadStatus alloc] initWithStatus:status];
        thwHistoryItem *newItem = [[thwHistoryItem alloc] initWithName:name size:size timeLeft:<#(NSString *)#> downloadStatus:<#(thwDownloadStatus *)#>];
        [array addObject:newItem];
    }*/
    
    return array;
}

@end
