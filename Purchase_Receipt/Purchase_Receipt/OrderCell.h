//
//  OrderCell.h
//  barcodeReader
//
//  Created by Madhumathi Karthikeyan on 03/01/14.
//

#import <UIKit/UIKit.h>

@protocol TouchDelegateForOrderCell <NSObject> //this delegate is fired each time you clicked the cell

- (void)touchedTheCell:(UITextField *)txtField :(NSString*)qty;

@end

@interface OrderCell : UITableViewCell<UITextFieldDelegate>

@property (strong, nonatomic) UILabel *itemlbl;
@property (strong, nonatomic) UILabel *descLbl;
@property (strong, nonatomic) UITextField *qtyTxt;

//@property (strong, nonatomic) UILabel *receiptDate;
//@property (strong, nonatomic) UILabel *supplierNo;
//@property (strong, nonatomic) UILabel *purchaseNo;
//@property (strong, nonatomic) UILabel *purchaseOrderLine;
//@property (strong, nonatomic) UILabel *purchaseOrderLineSubnumber;
//@property (strong, nonatomic) UILabel *receivedQuantity;
//@property (strong, nonatomic) UILabel *warehouse;
//@property (strong, nonatomic) UILabel *deliveryMethod;
//
@property(nonatomic, assign)id<TouchDelegateForOrderCell> delegate;

@end
