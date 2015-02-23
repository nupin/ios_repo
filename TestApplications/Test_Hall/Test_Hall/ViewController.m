//
//  ViewController.m
//  Test_Hall
//
//  Created by Nupin Pillai on 14/01/15.
//  Copyright (c) 2015 Nupin Pillai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,retain) NSMutableArray* stateArray;
@property(nonatomic,retain) NSMutableArray* regionArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _regionLbl = [[UILabel alloc]initWithFrame:CGRectMake(257, 244, 282, 21)];
    _regionLbl.backgroundColor=[UIColor greenColor];
    [self.view addSubview:_regionLbl];
    
    _stateLbl.backgroundColor=[UIColor greenColor];
    
    
    _stateArray = [[NSMutableArray alloc]initWithObjects:@"Kerala",@"TamilNadu", nil];
    
    
    _regionPicker.userInteractionEnabled=NO;
    _datePicker.userInteractionEnabled=NO;
    
    
    _submitBtn.userInteractionEnabled=NO;
    
    
//    _statePicker.delegate=self;
//    _regionPicker.delegate=self;
//    
//    _statePicker.dataSource=self;
//    _regionPicker.dataSource=self;


    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)dateSelection:(id)sender {
    
  //  _dateLbl.text = _datePicker.date;
    
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:[NSString stringWithFormat:@"MMMM dd, yyyy"]];
    _dateLbl.text = [formatter stringFromDate:_datePicker.date];
    
}

- (IBAction)submitBtn:(id)sender {
    
   
    
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
    
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (pickerView == _statePicker) {
        return [_stateArray count];
    }
    else{
        return [_regionArray count];
        
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    if (pickerView == _statePicker) {

        return [_stateArray objectAtIndex:row];
    }
    else{
        return [_regionArray objectAtIndex:row];

    }
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView == _statePicker) {
        
        _stateLbl.text =[_stateArray objectAtIndex:row];
        _regionPicker.userInteractionEnabled=YES;
        _regionArray = [self getRegionForState:[_stateArray objectAtIndex:row]];
        [_regionPicker reloadAllComponents];
    }
    else{
        _regionLbl.text =[_regionArray objectAtIndex:row];
        _datePicker.userInteractionEnabled=YES;

    }
    
    if ([_stateLbl.text length] && [_regionLbl.text length]  && [_dateLbl.text length] ) {
        _submitBtn.userInteractionEnabled=YES;
    }
    else{
        _submitBtn.userInteractionEnabled=NO;

    }
}


-(NSMutableArray*)getRegionForState:(NSString *) state{
    
    if ([state isEqualToString:@"TamilNadu"]){
        return [[NSMutableArray alloc]initWithObjects:@"Chennai",@"Madurai", nil];
    }
    else{
        return [[NSMutableArray alloc]initWithObjects:@"Kollam",@"Kottayam", nil];
    }
    
}
@end
