//
//  DetailViewController.h
//  SampleMD
//
//  Created by Nupin Pillai on 12/01/15.
//  Copyright (c) 2015 Nupin Pillai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

