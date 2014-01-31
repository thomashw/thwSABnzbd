//
//  thwHistoryItem.h
//  sabnzbd
//
//  Created by Thomas Hewton-Waters on 1/29/2014.
//  Copyright (c) 2014 thomashw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface thwHistoryItem : NSObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *size;
@property (nonatomic, retain) NSString *status;

+ (NSArray*) getItemsFromHistoryDictionary:(NSDictionary*)dictionary;

@end
