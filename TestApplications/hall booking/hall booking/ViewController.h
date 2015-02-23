//
//  ViewController.h
//  hall booking
//
//  Created by Nupin Pillai on 17/01/15.
//  Copyright (c) 2015 Nupin Pillai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *countryLbl;
@property (strong, nonatomic) IBOutlet UILabel *stateLbl;
@property (strong, nonatomic) IBOutlet UILabel *regionLbl;
@property (strong, nonatomic) IBOutlet UILabel *dateLbl;

@property (weak, nonatomic) IBOutlet UIPickerView *countryPick;
@property (weak, nonatomic) IBOutlet UIPickerView *statePick;
@property (weak, nonatomic) IBOutlet UIPickerView *regionPick;
@property (weak, nonatomic) IBOutlet UIPickerView *datePick;


@property (weak, nonatomic) IBOutlet UIDatePicker *selectDate;

@end

