//
//  thwHistoryTableViewController.m
//  sabnzbd
//
//  Created by Thomas Hewton-Waters on 1/24/2014.
//  Copyright (c) 2014 thomashw. All rights reserved.
//

#import "thwHistoryTableViewController.h"
#import "thwHistoryItem.h"
#import "thwHistoryDetailTableViewController.h"

@interface thwHistoryTableViewController ()

@end

@implementation thwHistoryTableViewController

NSString *const HISTORY_API_MODE = @"history";

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"Download History"];
    [self retrieveDataWithApiMode:HISTORY_API_MODE];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"HistoryDetailSegue"])
    {
        NSIndexPath *selectedRowIndexPath = [self.tableView indexPathForSelectedRow];
        thwHistoryItem *selectedItem = [self.items objectAtIndex:selectedRowIndexPath.row];
        
        thwHistoryDetailTableViewController *viewController = [segue destinationViewController];
        [viewController setHistoryItem:selectedItem];
    }
}

#pragma mark - Table view data source

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [super connectionDidFinishLoading:connection];
    [self setItems:[thwHistoryItem getItemsFromHistoryDictionary:self.jsonDictionary]];
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
