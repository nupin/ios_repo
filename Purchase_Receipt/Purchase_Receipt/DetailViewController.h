//
//  DetailViewController.h
//  Purchase Receipt
//
//  Created by Nupin Pillai on 12/01/15.
//  Copyright (c) 2015 Nupin Pillai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) UIPopoverController *masterPopoverController;

@end

