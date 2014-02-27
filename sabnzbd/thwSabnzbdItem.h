//
//  thwSabnzbdItem.h
//  sabnzbd
//
//  Created by Thomas Hewton-Waters on 1/31/2014.
//  Copyright (c) 2014 thomashw. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const SIZE = @"size";
static NSString *const SLOTS = @"slots";
static NSString *const STATUS = @"status";
static NSString *const NZO_ID = @"nzo_id";

@class thwDownloadStatus;

@interface thwSabnzbdItem : NSObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *size;
@property (nonatomic, retain) NSString *nzoId;
@property (nonatomic, retain) thwDownloadStatus *downloadStatus;

- (id)initWithName:(NSString *)name
              size:(NSString *)size
             nzoId:(NSString *)nzoId
    downloadStatus:(thwDownloadStatus *)downloadStatus;

+ (NSArray*) getItemsFromHistoryDictionary:(NSDictionary*)dictionary;

@end
