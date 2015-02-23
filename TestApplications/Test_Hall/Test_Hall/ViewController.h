//
//  ViewController.h
//  Test_Hall
//
//  Created by Nupin Pillai on 14/01/15.
//  Copyright (c) 2015 Nupin Pillai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>

@property (strong,nonatomic) IBOutlet UILabel *stateLbl;
@property (strong,nonatomic) IBOutlet UIPickerView *statePicker;

@property (strong,nonatomic) UILabel *regionLbl;
@property (strong,nonatomic) IBOutlet UIPickerView *regionPicker;
@property (weak, nonatomic) IBOutlet UILabel *dateLbl;
@property (strong,nonatomic) IBOutlet UIDatePicker *datePicker;

- (IBAction)submitBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;

@end

