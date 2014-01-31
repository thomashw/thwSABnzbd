//
//  thwTableViewController.h
//  sabnzbd
//
//  Created by Thomas Hewton-Waters on 1/30/2014.
//  Copyright (c) 2014 thomashw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface thwTableViewController : UITableViewController <NSURLConnectionDataDelegate>

@property (nonatomic, retain) NSDictionary *jsonDictionary;
@property (nonatomic, retain) NSArray *items;

- (void)retrieveDataWithApiMode:(NSString *)apiMode andMaximumNumberOfItems:(NSInteger)numItems;
- (void)setTitle:(NSString *)title;

@end
