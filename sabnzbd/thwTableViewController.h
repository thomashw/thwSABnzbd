//
//  thwTableViewController.h
//  sabnzbd
//
//  Created by Thomas Hewton-Waters on 1/30/2014.
//  Copyright (c) 2014 thomashw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface thwTableViewController : UITableViewController <NSURLConnectionDataDelegate>
{
    UIRefreshControl *refreshControl;
}

@end
