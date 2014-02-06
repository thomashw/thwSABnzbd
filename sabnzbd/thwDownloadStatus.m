//
//  thwDownloadStatus.m
//  sabnzbd
//
//  Created by Thomas Hewton-Waters on 2/6/2014.
//  Copyright (c) 2014 thomashw. All rights reserved.
//

#import "thwDownloadStatus.h"

@interface thwDownloadStatus ()
{
    DownloadStatus downloadStatus;
}

@property (nonatomic, retain) NSString *statusString;

@end

@implementation thwDownloadStatus

- (id)initWithString:(NSString *)statusString {
    self = [super init];
    if(self)
    {
        _statusString = statusString;
        [self setStatus:statusString];
    }
    
    return self;
}

- (NSString *)toString
{
    return self.statusString;
}

- (DownloadStatus)status
{
    return downloadStatus;
}

- (void)setStatus:(NSString *)aStatus
{
    if([aStatus isEqualToString:@"Completed"])
    {
        downloadStatus = DownloadStatusCompleted;
    }
    else if([aStatus isEqualToString:@"Downloading"])
    {
        downloadStatus = DownloadStatusDownloading;
    }
    else if([aStatus isEqualToString:@"Paused"])
    {
        downloadStatus = DownloadStatusPaused;
    }
    else if([aStatus isEqualToString:@"Failed"])
    {
        downloadStatus = DownloadStatusFailed;
    }
    else if([aStatus isEqualToString:@"Queued"])
    {
        downloadStatus = DownloadStatusQueued;
    }
}

- (UIImage *)image
{
    UIImage *image = NULL;
    
    switch(downloadStatus) {
        case DownloadStatusPaused:
            image = [UIImage imageNamed:@"status_yellow.png"];
            break;
        case DownloadStatusDownloading:
            image = [UIImage imageNamed:@"status_green.png"];
            break;
        default:
            image = NULL;
            break;
    }
    
    return image;
}

@end
