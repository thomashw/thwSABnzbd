//
//  thwQueueItem.m
//  sabnzbd
//
//  Created by Thomas Hewton-Waters on 2/25/2014.
//  Copyright (c) 2014 thomashw. All rights reserved.
//

#import "thwQueueItem.h"
#import "thwDownloadStatus.h"

@implementation thwQueueItem

NSString *const FILE_NAME = @"filename";
NSString *const PERCENTAGE = @"percentage";
NSString *const QUEUE = @"queue";
NSString *const TIME_LEFT = @"timeleft";

- (id)initWithName:(NSString *)name
              size:(NSString *)size
             nzoId:(NSString *)nzoId
          timeLeft:(NSString *)timeLeft
downloadPercentage:(NSString *)downloadPercentage
    downloadStatus:(thwDownloadStatus *)downloadStatus
{
    self = [super initWithName:name size:size nzoId:nzoId downloadStatus:downloadStatus];
    if(self)
    {
        _downloadPercentage = downloadPercentage;
        _timeLeft = timeLeft;
    }
    
    return self;
}

+ (NSArray *) getItemsFromQueueDictionary:(NSDictionary*)dictionary
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSDictionary *queueDictionary = [dictionary objectForKey:QUEUE];
    NSArray *slotsArray = [queueDictionary objectForKey:SLOTS];
    
    for (NSDictionary *nzbDownload in slotsArray) {
        NSString *name = [nzbDownload objectForKey:FILE_NAME];
        NSString *size = [nzbDownload objectForKey:SIZE];
        NSString *nzoId = [nzbDownload objectForKey:NZO_ID];
        NSString *status = [nzbDownload objectForKey:STATUS];
        NSString *timeLeft = [nzbDownload objectForKey:TIME_LEFT];
        NSString *downloadPercentage = [nzbDownload objectForKey:PERCENTAGE];
        thwDownloadStatus *downloadStatus = [[thwDownloadStatus alloc] initWithString:status];
        thwQueueItem *newItem = [[thwQueueItem alloc] initWithName:name
                                                              size:size
                                                             nzoId:nzoId
                                                          timeLeft:timeLeft
                                                downloadPercentage:downloadPercentage
                                                    downloadStatus:downloadStatus];
        [array addObject:newItem];
    }
    
    return array;
}

@end
