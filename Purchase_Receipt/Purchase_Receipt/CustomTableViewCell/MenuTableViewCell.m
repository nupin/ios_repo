//
//  MenuTableViewCell.m
//  Purchase Receipt
//
//  Created by Nupin Pillai on 13/01/15.
//  Copyright (c) 2015 Nupin Pillai. All rights reserved.
//

#import "MenuTableViewCell.h"

@implementation MenuTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
     self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        _tableImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 84, 84)];
        
        [self.contentView addSubview:_tableImageView];
        
        self.contentView.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1];
    }
    
    return self;
    
}
@end
