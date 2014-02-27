//
//  thwSabnzbdItem.m
//  sabnzbd
//
//  Created by Thomas Hewton-Waters on 1/31/2014.
//  Copyright (c) 2014 thomashw. All rights reserved.
//

#import "thwSabnzbdItem.h"
#import "thwDownloadStatus.h"

@implementation thwSabnzbdItem

NSString *const HISTORY = @"history";
NSString *const NAME = @"name";

- (id)initWithName:(NSString *)name
              size:(NSString *)size
             nzoId:(NSString *)nzoId
    downloadStatus:(thwDownloadStatus *)downloadStatus
{
    self = [super init];
    if(self)
    {
        _name = name;
        _size = size;
        _nzoId = nzoId;
        _downloadStatus = downloadStatus;
    }
    
    return self;
}

+ (NSArray *) getItemsFromHistoryDictionary:(NSDictionary*)dictionary
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSDictionary *historyDictionary = [dictionary objectForKey:HISTORY];
    NSArray *slotsArray = [historyDictionary objectForKey:SLOTS];
    
    for (NSDictionary *nzbDownload in slotsArray) {
        NSString *name = [nzbDownload objectForKey:NAME];
        NSString *size = [nzbDownload objectForKey:SIZE];
        NSString *status = [nzbDownload objectForKey:STATUS];
        NSString *nzoId = [nzbDownload objectForKey:NZO_ID];
        thwDownloadStatus *downloadStatus = [[thwDownloadStatus alloc] initWithString:status];
        thwSabnzbdItem *newItem = [[thwSabnzbdItem alloc] initWithName:name
                                                                  size:size
                                                                 nzoId:nzoId
                                                        downloadStatus:downloadStatus];
        [array addObject:newItem];
    }
    
    return array;
}

@end
