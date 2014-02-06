//
//  thwSabnzbdItem.m
//  sabnzbd
//
//  Created by Thomas Hewton-Waters on 1/31/2014.
//  Copyright (c) 2014 thomashw. All rights reserved.
//

#import "thwSabnzbdItem.h"

@implementation thwSabnzbdItem

- (id)initWithName:(NSString *)name size:(NSString *)size timeLeft:(NSString *)timeLeft downloadStatus:(thwDownloadStatus *)downloadStatus
{
    self = [super init];
    if(self)
    {
        _name = name;
        _size = size;
        _timeLeft = timeLeft;
        _downloadStatus = downloadStatus;
    }
    
    return self;
}

@end
