//
//  thwQueueItem.h
//  sabnzbd
//
//  Created by Thomas Hewton-Waters on 2/25/2014.
//  Copyright (c) 2014 thomashw. All rights reserved.
//

#import "thwSabnzbdItem.h"

@interface thwQueueItem : thwSabnzbdItem

@property (nonatomic, retain) NSString *timeLeft;
@property (nonatomic, retain) NSString *downloadPercentage;

- (id)initWithName:(NSString *)name
              size:(NSString *)size
          timeLeft:(NSString *)timeLeft
downloadPercentage:(NSString *)downloadPercentage
    downloadStatus:(thwDownloadStatus *)downloadStatus;

+ (NSArray*) getItemsFromQueueDictionary:(NSDictionary*)dictionary;

@end
