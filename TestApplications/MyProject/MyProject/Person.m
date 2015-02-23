//
//  Person.m
//  MyProject
//
//  Created by Nupin Pillai on 30/01/15.
//  Copyright (c) 2015 Nupin Pillai. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)enterInfo{
    NSLog(@"Enter First Name");
    char cstring[40];
    scanf("%s",cstring);
    firstName = [NSString stringWithCString:cstring encoding:1];
    
    NSLog(@"Enter Last Name");
    scanf("%s",cstring);
    lastName = [NSString stringWithCString:cstring encoding:1];
    
    NSLog(@"Enter age");
    scanf("%i",&age);
}

-(void)printInfo{
    NSLog(@"firstName - %@",firstName);
    NSLog(@"lastName - %@",lastName);
    
    NSLog(@"I am %@ %@ . I am %i years old" , firstName , lastName , age);
}

@end
