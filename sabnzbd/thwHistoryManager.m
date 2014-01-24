//
//  thwHistoryManager.m
//  sabnzbd
//
//  Created by Thomas Hewton-Waters on 1/23/2014.
//  Copyright (c) 2014 thomashw. All rights reserved.
//

#import "thwHistoryManager.h"

@implementation thwHistoryManager

NSString *const SABNZBD_IP = @"192.168.1.88";
NSString *const SABNZBD_PORT = @"55000";
NSString *const SABNZBD_API_KEY=@"23ed657114d8d56692a18e613c5b0221";

- (void)getHistory
{
    NSString *urlString = [NSString stringWithFormat:@"http://%@:%@/sabnzbd/api?output=json&apikey=%@", SABNZBD_IP, SABNZBD_PORT, SABNZBD_API_KEY];
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
    [[self data] appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:[self data] options:0 error:nil]);
}

@end
