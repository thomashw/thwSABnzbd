//
//  thwQueueTableViewCell.h
//  sabnzbd
//
//  Created by Thomas Hewton-Waters on 2/5/2014.
//  Copyright (c) 2014 thomashw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface thwQueueTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *title;
@property (nonatomic, weak) IBOutlet UILabel *status;
@property (nonatomic, weak) IBOutlet UILabel *timeLeft;
@property (nonatomic, weak) IBOutlet UILabel *size;

@end
