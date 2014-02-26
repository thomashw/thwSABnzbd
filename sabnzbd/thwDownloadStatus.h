//
//  thwDownloadStatus.h
//  sabnzbd
//
//  Created by Thomas Hewton-Waters on 2/6/2014.
//  Copyright (c) 2014 thomashw. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum DownloadStatus {
    DownloadStatusPaused = 0,
    DownloadStatusDownloading,
    DownloadStatusCompleted,
    DownloadStatusFailed,
    DownloadStatusQueued,
    DownloadStatusGrabbing
} DownloadStatus;

@interface thwDownloadStatus : NSObject

- (id)initWithString:(NSString *)statusString;
- (NSString *)toString;
- (UIImage *)image;

@end
