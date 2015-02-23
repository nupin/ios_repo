//
//  PRRowDetailController.h
//  Purchase Receipt
//
//  Created by Nupin Pillai on 28/01/15.
//  Copyright (c) 2015 Nupin Pillai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PRRowDetailController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *purchaseOrderNo;

@property (strong, nonatomic) IBOutlet UILabel *wareHouse;

@property (strong, nonatomic) IBOutlet UILabel *supplier;

@property (strong, nonatomic) IBOutlet UILabel *facility;

@property (strong, nonatomic) IBOutlet UILabel *discount;

@property (strong, nonatomic) IBOutlet UILabel *itemNo;

@property (strong, nonatomic) IBOutlet UILabel *supplierItemNo;

@property (strong, nonatomic) IBOutlet UILabel *purchasePrice;
@property (strong, nonatomic) IBOutlet UILabel *buyer;


@property (strong) NSDictionary *rowDictionary;

@end
