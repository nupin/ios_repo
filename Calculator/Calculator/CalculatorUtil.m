//
//  CalculatorUtil.m
//  Calculator
//
//  Created by Nupin Pillai on 31/12/14.
//  Copyright (c) 2014 Nupin Pillai. All rights reserved.
//

#import "CalculatorUtil.h"

@interface CalculatorUtil()
@property (nonatomic,strong) NSMutableArray *operandArray;
@end

@implementation CalculatorUtil

@synthesize operandArray = _operandArray;

- (NSMutableArray *)operandArray
{
    if (!_operandArray)
    {
        _operandArray = [[NSMutableArray alloc] init ];
    }
    return _operandArray;
}

- (void)setOperandArray:(NSMutableArray *)array
{
    _operandArray = array;
}

- (void)pushOperation:(double)num
{
    [self.operandArray addObject:[NSNumber numberWithDouble:num]];
}

- (double)popOperation
{
    NSNumber* operandObj = [self.operandArray lastObject];
    if(operandObj)
    {
        [self.operandArray removeLastObject] ;
    }
    
    return [operandObj doubleValue];
}

- (double)performOperation:(NSString*)operand
{
    double result = 0 ;
    if ([operand isEqualToString:@"+"])
    {
        result = self.popOperation + self.popOperation;
    }
    else if ([operand isEqualToString:@"*"])
    {
        double mulEnd = self.popOperation ;
        double mulTop = self.popOperation ;
        if(mulTop>0)
        {
            result = mulEnd * mulTop ;
        }
        else
        {
            result = mulEnd * 1 ;
        }
    }
    else if ([operand isEqualToString:@"-"])
    {
        double subractEnd = self.popOperation ;
        double subractTop = self.popOperation ;
        if (subractTop>0)
        {
            result = subractTop - subractEnd ;
        }
        else
        {
             result = subractEnd ;
        }
    }
    else if ([operand isEqualToString:@"/"])
    {
        double divisor = self.popOperation ;
        double divident = self.popOperation ;
        if (divident>0)
        {
            result = divident/ divisor ;
        }
        else
        {
            result = divisor ;
        }
    }
    
    [self pushOperation:result];
    
    return result ;
}

@end
