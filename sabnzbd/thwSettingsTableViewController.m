//
//  thwSettingsTableViewController.m
//  sabnzbd
//
//  Created by Thomas Hewton-Waters on 2014-04-06.
//  Copyright (c) 2014 thomashw. All rights reserved.
//

#import "thwSettingsTableViewController.h"
#import "constants.h"

#define REQUIRED @"Required"

enum TextFieldTag {
    TextFieldTagIpAddress = 0,
    TextFieldTagPort,
    TextFieldTagApi
};

@implementation thwSettingsTableViewController

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
    
    [self loadSavedSettings];
    
    [ipAddressTextField addTarget:self
                           action:@selector(textChangedForTextfield:)
                 forControlEvents:UIControlEventEditingChanged];
    [portTextField addTarget:self
                           action:@selector(textChangedForTextfield:)
                 forControlEvents:UIControlEventEditingChanged];
    [apiTextField addTarget:self
                           action:@selector(textChangedForTextfield:)
                 forControlEvents:UIControlEventEditingChanged];

    
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

- (void)loadSavedSettings
{
    NSString *ipAddress = [[NSUserDefaults standardUserDefaults]
                           objectForKey:USER_DEFAULTS_IP_ADDRESS_KEY];
    NSString *port = [[NSUserDefaults standardUserDefaults]
                      objectForKey:USER_DEFAULTS_PORT_KEY];
    NSString *apiKey = [[NSUserDefaults standardUserDefaults]
                        objectForKey:USER_DEFAULTS_SAB_API_KEY];


    [self setText:ipAddress forTextField:ipAddressTextField];
    [self setText:port forTextField:portTextField];
    [self setText:apiKey forTextField:apiTextField];
}

- (void)setText:(NSString *)text forTextField:(UITextField *)textField
{
    if(text != nil && text.length > 0)
    {
        [textField setText:text];
    }
    else
    {
        [textField setText:REQUIRED];
    }
}

- (void)textChangedForTextfield:(UITextField *)textField
{
    NSInteger tag = textField.tag;
    NSString *text = textField.text;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    switch(tag)
    {
        case TextFieldTagIpAddress:
            NSLog(@"Setting IP address to %@", text);
            [userDefaults setObject:text forKey:USER_DEFAULTS_IP_ADDRESS_KEY];
            break;
        case TextFieldTagPort:
            NSLog(@"Setting port to %@", text);
            [userDefaults setObject:text forKey:USER_DEFAULTS_PORT_KEY];
            break;
        case TextFieldTagApi:
            NSLog(@"Setting API key to %@", text);
            [userDefaults setObject:text forKey:USER_DEFAULTS_SAB_API_KEY];
            break;
        default:
            break;
    }
    
    [userDefaults synchronize];
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
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
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
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
