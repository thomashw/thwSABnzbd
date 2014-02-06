//
//  thwTableViewCell.m
//  sabnzbd
//
//  Created by Thomas Hewton-Waters on 2/5/2014.
//  Copyright (c) 2014 thomashw. All rights reserved.
//

#import "thwTableViewCell.h"

@implementation thwTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
