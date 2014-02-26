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

NSString *const FILE_NAME = @"filename";
NSString *const HISTORY = @"history";
NSString *const NAME = @"name";
NSString *const QUEUE = @"queue";
NSString *const SIZE = @"size";
NSString *const SLOTS = @"slots";
NSString *const STATUS = @"status";
NSString *const TIME_LEFT = @"timeleft";
NSString *const PERCENTAGE = @"percentage";

- (id)initWithName:(NSString *)name size:(NSString *)size timeLeft:(NSString *)timeLeft downloadPercentage:(NSString *)downloadPercentage downloadStatus:(thwDownloadStatus *)downloadStatus
{
    self = [super init];
    if(self)
    {
        _name = name;
        _size = size;
        _timeLeft = timeLeft;
        _downloadPercentage = downloadPercentage;
        _downloadStatus = downloadStatus;
    }
    
    return self;
}

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
        NSString *downloadPercentage = [nzbDownload objectForKey:PERCENTAGE];
        thwDownloadStatus *downloadStatus = [[thwDownloadStatus alloc] initWithString:status];
        thwSabnzbdItem *newItem = [[thwSabnzbdItem alloc] initWithName:name size:size timeLeft:timeLeft downloadPercentage:downloadPercentage downloadStatus:downloadStatus];
        [array addObject:newItem];
    }
    
    return array;
}

+ (NSArray*) getItemsFromHistoryDictionary:(NSDictionary*)dictionary
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSDictionary *historyDictionary = [dictionary objectForKey:HISTORY];
    NSArray *slotsArray = [historyDictionary objectForKey:SLOTS];
    
    for (NSDictionary *nzbDownload in slotsArray) {
        NSString *name = [nzbDownload objectForKey:NAME];
        NSString *size = [nzbDownload objectForKey:SIZE];
        NSString *status = [nzbDownload objectForKey:STATUS];
        NSString *timeLeft = @"";
        NSString *downloadPercentage = @"";
        thwDownloadStatus *downloadStatus = [[thwDownloadStatus alloc] initWithString:status];
        thwSabnzbdItem *newItem = [[thwSabnzbdItem alloc] initWithName:name size:size timeLeft:timeLeft downloadPercentage:downloadPercentage downloadStatus:downloadStatus];
        [array addObject:newItem];
    }
    
    return array;
}

@end
