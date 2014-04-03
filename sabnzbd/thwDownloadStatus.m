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

- (void)setStatus:(NSString *)status
{
    if([status isEqualToString:@"Completed"])
    {
        downloadStatus = DownloadStatusCompleted;
    }
    else if([status isEqualToString:@"Downloading"])
    {
        downloadStatus = DownloadStatusDownloading;
    }
    else if([status isEqualToString:@"Paused"])
    {
        downloadStatus = DownloadStatusPaused;
    }
    else if([status isEqualToString:@"Failed"])
    {
        downloadStatus = DownloadStatusFailed;
    }
    else if([status isEqualToString:@"Queued"])
    {
        downloadStatus = DownloadStatusQueued;
    }
    else if([status isEqualToString:@"Grabbing"])
    {
        downloadStatus = DownloadStatusGrabbing;
    }
}

- (UIImage *)image
{
    UIImage *image = NULL;
    
    switch(downloadStatus) {
        case DownloadStatusGrabbing:
        case DownloadStatusPaused:
        case DownloadStatusQueued:
            image = [UIImage imageNamed:@"status_yellow.png"];
            break;
        case DownloadStatusDownloading:
            image = [UIImage imageNamed:@"status_green.png"];
            break;
        case DownloadStatusFailed:
            image = [UIImage imageNamed:@"status_failed.png"];
            break;
        case DownloadStatusCompleted:
            image = [UIImage imageNamed:@"status_complete.png"];
            break;
        default:
            image = NULL;
            break;
    }
    
    return image;
}

@end
