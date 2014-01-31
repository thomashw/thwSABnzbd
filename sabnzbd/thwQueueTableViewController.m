//
//  thwQueueTableViewController.m
//  sabnzbd
//
//  Created by Thomas Hewton-Waters on 1/30/2014.
//  Copyright (c) 2014 thomashw. All rights reserved.
//

#import "thwQueueTableViewController.h"
#import "thwQueueItem.h"

@interface thwQueueTableViewController ()

@property (nonatomic, retain) NSArray *queueItems;

@end

@implementation thwQueueTableViewController

NSString *const QUEUE_API_MODE = @"queue";
NSInteger MAX_NUM_QUEUE_ITEMS = 50;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"Queue"];
    [self retrieveDataWithApiMode:QUEUE_API_MODE andMaximumNumberOfItems:MAX_NUM_QUEUE_ITEMS];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [super connectionDidFinishLoading:connection];
    [self setItems:[thwQueueItem getItemsFromQueueDictionary:self.jsonDictionary]];
    [self.tableView reloadData];
}

@end
