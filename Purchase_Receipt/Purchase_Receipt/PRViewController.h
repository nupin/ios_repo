//
//  PRViewController.h
//  Purchase Receipt
//
//  Created by Nupin Pillai on 12/01/15.
//  Copyright (c) 2015 Nupin Pillai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"
#import "PRRowDetailController.h"

@interface PRViewController : UIViewController <UISplitViewControllerDelegate,UITableViewDataSource,UITableViewDelegate,ZBarReaderDelegate,UITextFieldDelegate>

@property (strong,nonatomic) UIView* loadingScreen;
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
@property (strong, nonatomic) IBOutlet UITextField *prTxtField;
- (IBAction)onScanBtnPress:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *prOrderTblView;
@property (strong, nonatomic) ZBarReaderViewController *ZBarReaderVC;
@property (strong, atomic) PRRowDetailController *rowDetailController;

- (IBAction)onSubmitAction:(id)sender;
- (IBAction)selScannedPR:(id)sender;

//- (IBAction)selectScannedPR:(id)sender;


@end
