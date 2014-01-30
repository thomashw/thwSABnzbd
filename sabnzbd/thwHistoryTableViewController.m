//
//  thwHistoryTableViewController.m
//  sabnzbd
//
//  Created by Thomas Hewton-Waters on 1/24/2014.
//  Copyright (c) 2014 thomashw. All rights reserved.
//

#import "thwHistoryTableViewController.h"
#import "thwHistoryItem.h"

@interface thwHistoryTableViewController ()

@property (nonatomic, retain) NSMutableData *data;
@property (nonatomic, retain) NSArray *historyItems;

- (void)getHistory;

@end

@implementation thwHistoryTableViewController

NSString *const SABNZBD_IP = @"192.168.1.88";
NSString *const SABNZBD_PORT = @"55000";
NSString *const SABNZBD_API_KEY=@"23ed657114d8d56692a18e613c5b0221";

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        [self setHistoryItems:NULL];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getHistory];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(self.historyItems == NULL)
    {
        return 0;
    }
    else
    {
        return [self.historyItems count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    thwHistoryItem *item = [self.historyItems objectAtIndex:indexPath.row];
    [cell.textLabel setText:item.nzbName];
    
    return cell;
}


#pragma mark - NSURLConnectionDelegate

- (void)getHistory
{
    NSString *urlString = [NSString stringWithFormat:@"http://%@:%@/sabnzbd/api?output=json&apikey=%@&start=0&limit=2&mode=history", SABNZBD_IP, SABNZBD_PORT, SABNZBD_API_KEY];
    NSURL *sabnzbdUrl = [NSURL URLWithString:urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:sabnzbdUrl];
    [NSURLConnection connectionWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [self setData:[NSMutableData data]];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.data appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:[self data] options:0 error:nil];
    [self setHistoryItems:[thwHistoryItem getItemsFromHistoryDictionary:jsonDictionary]];
    [self.tableView reloadData];
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
