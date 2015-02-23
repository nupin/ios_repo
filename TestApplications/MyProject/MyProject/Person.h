//
//  Person.h
//  MyProject
//
//  Created by Nupin Pillai on 30/01/15.
//  Copyright (c) 2015 Nupin Pillai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
NSString *firstName ;
NSString *lastName ;
int age ;
}
-(void)enterInfo;
-(void)printInfo;

@end
