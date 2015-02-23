//
//  PRViewController.m
//  Purchase Receipt
//
//  Created by Nupin Pillai on 12/01/15.
//  Copyright (c) 2015 Nupin Pillai. All rights reserved.
//

#import "PRViewController.h"
#import "OrderCell.h"
#import "DataManager.h"

@implementation PRViewController
NSMutableArray* orderArray;

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController
     willHideViewController:(UIViewController *)viewController
          withBarButtonItem:(UIBarButtonItem *)barButtonItem
       forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"File list", @"File list");
    [self.navigationItem setLeftBarButtonItem:barButtonItem
                                     animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController
     willShowViewController:(UIViewController *)viewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(LoadOrderLines:) name:@"PurchaseOrderSavedNotification" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeLoadingScreen) name:@"RequestFailedNotification" object:nil];

    
    
    orderArray = [[NSMutableArray alloc] init];
    
    self.ZBarReaderVC = [ZBarReaderViewController new];
    self.ZBarReaderVC.readerDelegate = self;
    [self.ZBarReaderVC.scanner setSymbology: ZBAR_QRCODE
                                     config: ZBAR_CFG_ENABLE
                                         to: 0];
    self.ZBarReaderVC.readerView.zoom = 1.0;
    
    
    UILabel* versionLbl = [[UILabel alloc] initWithFrame:CGRectMake(300, 1000, 70, 20)];
    versionLbl.text =[[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString*)kCFBundleVersionKey];
    [self.view addSubview:versionLbl];
    [self.view sendSubviewToBack:versionLbl];
    
}

-(void) LoadOrderLines:(NSNotification*)notification
{
    if ([orderArray count]) {
        
        [orderArray removeAllObjects];
    }
    orderArray = [[DataManager sharedManager] getOrderLines];
    [_prOrderTblView reloadData];
    [self removeLoadingScreen];
}

#pragma TableView DataSource 

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [orderArray count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    OrderCell* orderCell = [tableView dequeueReusableCellWithIdentifier:@"OrderCell"];
    
    if (!orderCell) {
        
        orderCell = [[OrderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"OrderCell"];
        
    }
    
    
    NSDictionary* order = [orderArray objectAtIndex:indexPath.row];
    
    orderCell.itemlbl.text = [order objectForKey:@"ITNO_ItemNumber"];
    orderCell.descLbl.text = [order objectForKey:@"PITT_PurchaseOrderItemDescription"];
    orderCell.qtyTxt.text = [order objectForKey:@"PUCD_PurchasePriceQuantity"];
    
    
    return orderCell;
}


- (IBAction)onScanBtnPress:(id)sender {
    
    [self presentViewController:self.ZBarReaderVC animated:YES completion:nil];
    
}


//Enter Button Action
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [self displayLoadingScreen];
    [[DataManager sharedManager] getPurchaseOrderLines:_prTxtField.text];

    return YES;
}

- (void) imagePickerController: (UIImagePickerController*) reader
 didFinishPickingMediaWithInfo: (NSDictionary*) info
{
    id<NSFastEnumeration> results =
    [info objectForKey: ZBarReaderControllerResults];
    ZBarSymbol *symbol = nil;
    for(symbol in results)
    {
        // EXAMPLE: just grab the first barcode
        break;
        
        // EXAMPLE: do something useful with the barcode data
        
    }
    
    _prTxtField.text=symbol.data;
    
    //[[DataManager sharedManager] getPurchaseOrderLines:_prTxtField.text]; // automatically retrieve

    
    [reader dismissViewControllerAnimated:YES completion:nil];
    
    
}

#pragma mark PrivateMethods

- (void)displayLoadingScreen
{
    if (!_loadingScreen)
    {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        _loadingScreen = [[UIView alloc] initWithFrame:screenRect];
        _loadingScreen.backgroundColor = [UIColor blackColor];
        _loadingScreen.alpha = 0.5f;
        _loadingScreen.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        UIActivityIndicatorView* activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        activity.center = CGPointMake(screenRect.size.width / 2, screenRect.size.height / 2);
        [_loadingScreen addSubview:activity];
        [activity startAnimating];
    }
    [[[UIApplication sharedApplication] keyWindow] addSubview:_loadingScreen];
}

- (void)removeLoadingScreen
{
    [_loadingScreen removeFromSuperview];
}
- (IBAction)onSubmitAction:(id)sender {
    
    [[DataManager sharedManager] submitPRRequest:orderArray];
    
}

- (IBAction)selScannedPR:(id)sender {
    [self displayLoadingScreen];
        [[DataManager sharedManager] getPurchaseOrderLines:_prTxtField.text];
}

//On clicking ok on scaned pr record
//- (IBAction)selectScannedPR:(id)sender {
//    [self displayLoadingScreen];
//    [[DataManager sharedManager] getPurchaseOrderLines:_prTxtField.text];
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //PRdetailview
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    

        
        if (_rowDetailController==nil) {
    
            _rowDetailController = [storyboard instantiateViewControllerWithIdentifier:@"PRdetailview"];
            
        }
    _rowDetailController.rowDictionary = [[NSDictionary alloc] initWithDictionary: [orderArray objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:_rowDetailController animated:YES];

    
}

@end
