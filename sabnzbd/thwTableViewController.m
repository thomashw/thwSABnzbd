//
//  thwTableViewController.m
//  sabnzbd
//
//  Created by Thomas Hewton-Waters on 1/30/2014.
//  Copyright (c) 2014 thomashw. All rights reserved.
//

#import "thwTableViewController.h"
#import "thwQueueItem.h"
#import "thwSabnzbdItem.h"
#import "thwTableViewCell.h"
#import "thwDownloadStatus.h"

typedef enum TableViewSection {
    TableViewSectionQueue = 0,
    TableViewSectionHistory,
    TableViewSectionCount
} TableViewSection;

typedef enum ApiMode {
    ApiModeQueue = 0,
    ApiModeHistory
} ApiMode;

@interface thwTableViewController ()

@property (nonatomic, retain) NSMutableArray *queueItems;
@property (nonatomic, retain) NSMutableArray *historyItems;

@end

@implementation thwTableViewController

NSString *const SABNZBD_IP = @"192.168.1.67";
NSString *const SABNZBD_PORT = @"55000";
NSString *const SABNZBD_API_KEY = @"97832ab5af3e381a42b0260fb545430b";

NSString *const TABLE_TITLE = @"Downloads";
NSInteger const MAX_NUM_QUEUE_ITEMS = 50;

NSString *const API_MODE_QUEUE = @"queue";
NSString *const API_MODE_HISTORY = @"history";

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:TABLE_TITLE];
    [self retrieveDataWithApiMode:ApiModeQueue andMaximumNumberOfItems:MAX_NUM_QUEUE_ITEMS];
    [self retrieveDataWithApiMode:ApiModeHistory andMaximumNumberOfItems:MAX_NUM_QUEUE_ITEMS];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setTitle:(NSString *)title
{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [titleLabel setTextColor:[UIColor whiteColor]];
    [titleLabel setText:title];
    [self.navigationItem setTitleView:titleLabel];
    [titleLabel sizeToFit];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return TableViewSectionCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows = 0;
    
    switch (section) {
        case TableViewSectionQueue:
            if(self.queueItems != nil)
            {
                rows = [self.queueItems count];
            }
            break;
        case TableViewSectionHistory:
            if(self.historyItems != nil)
            {
                rows = [self.historyItems count];
            }
            break;
        default:
            break;
    }
    
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    thwTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    thwSabnzbdItem *historyItem = nil;
    thwQueueItem *queueItem = nil;
    
    switch (indexPath.section) {
        case TableViewSectionQueue:
            queueItem = [self.queueItems objectAtIndex:indexPath.row];
            [cell.progressView setAlpha:1.0];
            
            [cell.title setText:queueItem.name];
            [cell.size setText:queueItem.size];
            [cell.status setText:[queueItem.downloadStatus toString]];
            [cell.timeLeft setText:queueItem.timeLeft];
            [cell.statusImage setImage:[queueItem.downloadStatus image]];
            [cell.progressView setProgress:([queueItem.downloadPercentage floatValue]/100.0)];
            break;
            
        case TableViewSectionHistory:
            historyItem = [self.historyItems objectAtIndex:indexPath.row];
            [cell.progressView setAlpha:0.0];
            [cell.timeLeft setText:@""];
            
            [cell.title setText:historyItem.name];
            [cell.size setText:historyItem.size];
            [cell.status setText:[historyItem.downloadStatus toString]];
            [cell.statusImage setImage:[historyItem.downloadStatus image]];
            break;
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    thwSabnzbdItem *item = nil;
    
    switch (indexPath.section) {
        case TableViewSectionQueue:
            item = [self.queueItems objectAtIndex:indexPath.row];
            [self deleteItemWithApiMode:ApiModeQueue andNzoId:item.nzoId];
            [self.queueItems removeObjectAtIndex:indexPath.row];
            break;
        case TableViewSectionHistory:
            item = [self.historyItems objectAtIndex:indexPath.row];
            [self deleteItemWithApiMode:ApiModeHistory andNzoId:item.nzoId];
            [self.historyItems removeObjectAtIndex:indexPath.row];
            break;
        default:
            break;
    }
    
    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                          withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - NSURLConnection

- (void)deleteItemWithApiMode:(ApiMode)apiMode
                     andNzoId:(NSString *)nzoId
{
    NSString *apiModeString = [self getApiModeStringFromApiMode:apiMode];
    
    NSString *urlString = [NSString stringWithFormat:@"http://%@:%@/sabnzbd/api?output=json&apikey=%@&mode=%@&name=delete&value=%@",
                           SABNZBD_IP,
                           SABNZBD_PORT,
                           SABNZBD_API_KEY,
                           apiModeString,
                           nzoId];
    
    NSURL *sabnzbdUrl = [NSURL URLWithString:urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:sabnzbdUrl];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
     }];
}

- (void)retrieveDataWithApiMode:(ApiMode)apiMode andMaximumNumberOfItems:(NSInteger)numItems
{
    NSString *apiModeString = [self getApiModeStringFromApiMode:apiMode];
    
    NSString *urlString = [NSString stringWithFormat:@"http://%@:%@/sabnzbd/api?output=json&apikey=%@&start=0&limit=%ld&mode=%@",
                           SABNZBD_IP,
                           SABNZBD_PORT,
                           SABNZBD_API_KEY,
                           numItems,
                           apiModeString];
    
    NSURL *sabnzbdUrl = [NSURL URLWithString:urlString];
    [self retrieveDataWithApiMode:apiMode andURL:sabnzbdUrl];
}

- (NSString *)getApiModeStringFromApiMode:(ApiMode)apiMode
{
    NSString *apiModeString = nil;
    
    switch (apiMode) {
        case ApiModeHistory:
            apiModeString = API_MODE_HISTORY;
            break;
        case ApiModeQueue:
            apiModeString = API_MODE_QUEUE;
            break;
        default:
            NSLog(@"ERROR: Incorrect API mode specified");
            break;
    }
    
    return apiModeString;
}

- (void)retrieveDataWithApiMode:(ApiMode)apiMode andURL:(NSURL *)url
{
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         if(data != nil)
         {
             NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
             
             switch (apiMode) {
                 case ApiModeQueue:
                     [self setQueueItems:[NSMutableArray
                                          arrayWithArray:[thwQueueItem
                                                          getItemsFromQueueDictionary:jsonDictionary]]];
                     break;
                 case ApiModeHistory:
                     [self setHistoryItems:[NSMutableArray
                                            arrayWithArray:[thwSabnzbdItem
                                                            getItemsFromHistoryDictionary:jsonDictionary]]];
                     break;
                 default:
                     break;
             }
             
             [self.tableView reloadData];
         }
     }];
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
 */

@end
