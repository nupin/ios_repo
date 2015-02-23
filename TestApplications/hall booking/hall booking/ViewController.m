//
//  ViewController.m
//  hall booking
//
//  Created by Nupin Pillai on 17/01/15.
//  Copyright (c) 2015 Nupin Pillai. All rights reserved.
//

#import "ViewController.h"
#import "DBManager.h"
@interface ViewController ()

@property (nonatomic,retain) NSMutableArray *countryArray ;
@property (nonatomic,retain) NSMutableArray *stateArray ;
@property (nonatomic,retain) NSMutableArray *regionArray ;
@property (nonatomic,retain) NSMutableArray *dateArray ;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
//    _countryArray = [[NSMutableArray alloc]initWithObjects:@"India",@"China",@"Srilanka",@"USA",@"UK",@"Australia",@"UAE",nil];
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:[NSString stringWithFormat:@"MMMM dd, yyyy"]];
    _dateLbl.text = [formatter stringFromDate:_selectDate.date];
    
//    _dateLbl.text = _selectDate.date
    
    _countryArray = [[NSMutableArray alloc]init];
   _countryArray = [[DBManager getSharedInstance] getCountryArray];
    NSLog(@"%lu",(unsigned long)[_countryArray count]);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    if (_countryPick == pickerView) {
        return [_countryArray count];
    }
    else if (_statePick == pickerView){
        return [_stateArray count];
    }
    else {
        return [_regionArray count];
    }
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    if (_countryPick == pickerView) {
        _countryLbl.text =[_countryArray objectAtIndex:row];
        return [_countryArray objectAtIndex:row];
    }
    else if (_statePick == pickerView){
        _stateLbl.text =[_stateArray objectAtIndex:row];
        return [_stateArray objectAtIndex:row];
    }
    else {
        _regionLbl.text =[_regionArray objectAtIndex:row];
        return [_regionArray objectAtIndex:row];
    }

}

//
//- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
//{
//    if (pickerView == _countryPick) {
//        _stateLbl.text =[_stateArray objectAtIndex:row];
//        
//    }
//    else if (_statePick == pickerView){
//        _stateLbl.text =[_stateArray objectAtIndex:row];
//    }
//    else {
//        
//    }
//    
//}
- (IBAction)chooseDate:(id)sender {
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:[NSString stringWithFormat:@"MMMM dd, yyyy"]];
    _dateLbl.text = [formatter stringFromDate:_selectDate.date];

}

- (IBAction)submitAreaSearch:(id)sender {
}

@end
