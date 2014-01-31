//
//  thwQueueItem.h
//  sabnzbd
//
//  Created by Thomas Hewton-Waters on 1/30/2014.
//  Copyright (c) 2014 thomashw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface thwQueueItem : NSObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *size;
@property (nonatomic, retain) NSString *status;

+ (NSArray*) getItemsFromQueueDictionary:(NSDictionary*)dictionary;

@end
