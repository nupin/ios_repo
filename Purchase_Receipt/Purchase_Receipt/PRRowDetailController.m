//
//  PRRowDetailController.m
//  Purchase Receipt
//
//  Created by Nupin Pillai on 28/01/15.
//  Copyright (c) 2015 Nupin Pillai. All rights reserved.
//

#import "PRRowDetailController.h"

@implementation PRRowDetailController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    _purchaseOrderNo.text = [_rowDictionary objectForKey:@"PUNO_PurchaseOrderNumber"];
    _wareHouse.text = [_rowDictionary objectForKey:@"WHLO_Warehouse"];
    _supplier.text = [_rowDictionary objectForKey:@"SUNO_SupplierNumber"];
    _facility.text = [_rowDictionary objectForKey:@"FACI_Facility"];
    _discount.text = [_rowDictionary objectForKey:@"CFD3_ConfirmedDiscount3"];
    _itemNo.text = [_rowDictionary objectForKey:@"ITNO_ItemNumber"];
    _supplierItemNo.text = [_rowDictionary objectForKey:@"SITE_SupplierItemNumber"];
    _purchasePrice.text = [_rowDictionary objectForKey:@"PUPR_PurchasePrice"];
    _buyer.text = [_rowDictionary objectForKey:@"BUYE_Buyer"];
    
    
}

@end
