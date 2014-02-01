//
//  thwQueueItem.h
//  sabnzbd
//
//  Created by Thomas Hewton-Waters on 1/30/2014.
//  Copyright (c) 2014 thomashw. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "thwSabnzbdItem.h"

@interface thwQueueItem : thwSabnzbdItem

+ (NSArray*) getItemsFromQueueDictionary:(NSDictionary*)dictionary;

@end
