//
//  ViewController.m
//  Calculator
//
//  Created by Nupin Pillai on 29/12/14.
//  Copyright (c) 2014 Nupin Pillai. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorUtil.h"

@interface ViewController ()

@property (nonatomic) BOOL checkMiddleOfEntrNum ;
@property (nonatomic , strong) CalculatorUtil * calculate;
@property (nonatomic) double resultToDisdplay ;

@end

@implementation ViewController

@synthesize display ;

@synthesize checkMiddleOfEntrNum ;

@synthesize resultToDisdplay ;

@synthesize calculate = _calculate ;

- (CalculatorUtil *) calculate
{
  if(!_calculate)
  {
      _calculate = [[CalculatorUtil alloc]init];
  }
    return _calculate;
}

- (IBAction)digitPressed:(UIButton *)sender
{
    
    NSString *digit = sender.currentTitle ;
    
    NSLog(@"user touched %@",digit);
    
    if ([sender.currentTitle isEqualToString:@"CLR"])
    {
        _calculate = [[CalculatorUtil alloc]init];
        self.checkMiddleOfEntrNum = NO ;
        self.display.text = @"0";
        
    }
    else{
        if (self.checkMiddleOfEntrNum) {
            self.display.text = [self.display.text stringByAppendingString:digit];
        }
        else {
            self.display.text = digit ;
            self.checkMiddleOfEntrNum = YES ;
            
        }
    }
}
- (IBAction)calculation:(id)sender
{
    if(self.checkMiddleOfEntrNum)
    {
        [self result];
    }

    NSString *currentOper = [sender currentTitle];
    
    double result = [self.calculate performOperation:currentOper];
    self.resultToDisdplay = result ;
    self.display.text = [NSString stringWithFormat:@"%g",result];
}

- (IBAction)result {
    [self.calculate pushOperation: [self.display.text doubleValue] ];
    self.checkMiddleOfEntrNum = NO ;

}


@end
