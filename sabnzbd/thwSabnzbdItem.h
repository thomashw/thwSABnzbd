//
//  thwSabnzbdItem.h
//  sabnzbd
//
//  Created by Thomas Hewton-Waters on 1/31/2014.
//  Copyright (c) 2014 thomashw. All rights reserved.
//

#import <Foundation/Foundation.h>

@class thwDownloadStatus;

@interface thwSabnzbdItem : NSObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *size;
@property (nonatomic, retain) NSString *timeLeft;
@property (nonatomic, retain) thwDownloadStatus *downloadStatus;

- (id)initWithName:(NSString *)name
              size:(NSString *)size
          timeLeft:(NSString *)timeLeft
    downloadStatus:(thwDownloadStatus *)downloadStatus;

+ (NSArray*) getItemsFromQueueDictionary:(NSDictionary*)dictionary;

@end
