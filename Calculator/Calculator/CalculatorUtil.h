//
//  CalculatorUtil.h
//  Calculator
//
//  Created by Nupin Pillai on 31/12/14.
//  Copyright (c) 2014 Nupin Pillai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorUtil : NSObject

- (void)pushOperation:(double)num ;
- (double)popOperation ;
- (double)performOperation:(NSString*)operand;

@end
