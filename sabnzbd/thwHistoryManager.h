//
//  thwHistoryManager.h
//  sabnzbd
//
//  Created by Thomas Hewton-Waters on 1/23/2014.
//  Copyright (c) 2014 thomashw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface thwHistoryManager : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, retain) NSMutableData *data;

- (void)getHistory;

@end
