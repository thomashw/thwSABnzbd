//
//  thwHistoryItem.h
//  sabnzbd
//
//  Created by Thomas Hewton-Waters on 1/29/2014.
//  Copyright (c) 2014 thomashw. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "thwSabnzbdItem.h"

@interface thwHistoryItem : thwSabnzbdItem

+ (NSArray*) getItemsFromHistoryDictionary:(NSDictionary*)dictionary;

@end
